"""
Issues all queries in "queries" folder to a Presto cluster and records the results
"""

import argparse
import copy
import prestodb
import time
import requests
import logging
import os
from scripts.writer import DatasetWriter
from typing import Dict

QUERY_POLL_INTERVAL = 5
GLOBAL_ARGS = None
SAVED_FILE_NAME = "{0}-results.csv".format(int(time.time()))

data_writer 	= DatasetWriter()
logging.basicConfig(level = logging.INFO)

def seek_queries(query_root: str) -> [str]:
	legitimate_query_paths = []
	for directory, sub_dir, files in os.walk(query_root):
		for each_file in files:
			if ".sql" in each_file:
				legitimate_query_paths.append(os.path.join(directory, each_file))
	return legitimate_query_paths

def _execute_for_query_states(query: str, conn: prestodb.dbapi.Connection):
	cur = conn.cursor()
	cur.execute(query)
	cur.fetchall()
	return cur.stats

def _wait_query_completion(query_stats) -> None:
	logging.info("Awaiting query {0} completion".format(query_stats["queryId"]))
	while query_stats["state"] is "RUNNING" or query_stats["state"] is "QUEUED":
		time.sleep(QUERY_POLL_INTERVAL)
	logging.info("Query {0} finished".format(query_stats["queryId"]))
	return 

def _fetch_query_metadata(query_id: str):
	query_url 	= "http://{0}:{1}/v1/query/{2}".format(GLOBAL_ARGS.presto_host, GLOBAL_ARGS.port, query_id)
	resp 		= requests.get(	url 	= query_url, 
								headers = {'X-presto-user' : GLOBAL_ARGS.user})
	
	logging.info("Received response {0}".format(resp.status_code))
	if resp.status_code is not 200:
		logging.warn("Request errored with : {0}".format(resp.text))
		return None
	return resp.json()

def profile_query(query: str, conn: prestodb.dbapi.Connection):
	"""
	Executes a query and collect query level results
	We don't care what the results of the query are
	We only care about the metadata of the query

	Params:
		query (str) 						- Query string to issue
		conn prestodb.dbapi.Connection		- Initialized connection to Presto

	Returns:
		Dictionary 		- Query metadata
	"""
	try:
		query_stats = _execute_for_query_states(query = query, conn = conn)
		_wait_query_completion(query_stats = query_stats)
		fetch_query_metadata = _fetch_query_metadata(query_id = query_stats["queryId"])
		return {"queryId": query_stats["queryId"], "results": fetch_query_metadata}
	except Exception as ex:
		print(ex)
		return {"queryId": query_stats["queryId"], "results": None}

def enrich_with_cluster_config(query_stats):
	copied_stats = copy.copy(query_stats)
	copied_stats["coordinator_config"] = GLOBAL_ARGS.coordinator_config
	copied_stats["worker_config"] = GLOBAL_ARGS.worker_config
	return copied_stats

def save_states(query_stats):
	save_dir = "coord_{0}_worker_{1}".format(GLOBAL_ARGS.coordinator_config, GLOBAL_ARGS.worker_config)
	stats_file_path = os.path.join(GLOBAL_ARGS.results_root, save_dir, SAVED_FILE_NAME)
	logging.info("Saving stats to {0}".format(stats_file_path))
	data_writer.writeDictToCsv(to_save_dict = query_stats, mode='a+', location=stats_file_path)

if __name__ == "__main__":
	parser = argparse.ArgumentParser(description='Prestroid data collection parser')
	parser.add_argument('--presto-host', type=str, nargs='?', default='localhost', help='Presto host url')
	parser.add_argument('--port', type=int, nargs='?', default=8080, help='Presto port')
	parser.add_argument('--user', type=str, nargs='?', default='jkok005', help='Presto user')
	parser.add_argument('--catalog', type=str, nargs='?', default='tpcds', help='Presto catalog')
	parser.add_argument('--schema', type=str, nargs='?', default='sf1', help='Presto schema')
	parser.add_argument('--query-root', type=str, nargs='?', default='queries', help='Base directory for all queries to be executed')
	parser.add_argument('--results-root', type=str, nargs='?', default='results', help='Base directory to store all profiling results')
	parser.add_argument('--coordinator-config', type=str, nargs='?', default='default', help='Base directory to store all profiling results')
	parser.add_argument('--worker-config', type=str, nargs='?', default='default', help='Base directory to store all profiling results')
	parser.add_argument('--repeats', type=int, nargs='?', default=1, help='Presto port')
	args = parser.parse_args()

	logging.info(args)
	GLOBAL_ARGS = args

	conn 	= prestodb.dbapi.connect( 
        		host = GLOBAL_ARGS.presto_host, 
        		port = GLOBAL_ARGS.port, 
        		user = GLOBAL_ARGS.user, 
        		catalog = GLOBAL_ARGS.catalog, 
        		schema = GLOBAL_ARGS.schema)   

	all_queries = seek_queries(query_root = args.query_root)
	
	for _ in range(args.repeats):
		for each_query in all_queries:
			logging.info("Profiling {0}".format(each_query))
			with open(each_query, "r") as f:
				parsed_query = f.read().replace(";", "")
			results = profile_query(query = parsed_query, conn = conn)
			w_cluster_config_results = enrich_with_cluster_config(query_stats = results)
			w_cluster_config_results["query_name"] = each_query.split("/")[-1]
			w_cluster_config_results["scale_factor"] = GLOBAL_ARGS.schema
			w_cluster_config_results["query"] = parsed_query
			save_states(query_stats = w_cluster_config_results)