"""
Issues all queries in "queries" folder to a Presto cluster and records the results
"""

import argparse
import prestodb
import time
import requests
import logging
import os
from typing import Dict

QUERY_POLL_INTERVAL = 5
GLOBAL_ARGS = None

logging.basicConfig(level = logging.INFO)

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
	query_stats = _execute_for_query_states(query = query, conn = conn)
	_wait_query_completion(query_stats = query_stats)
	fetch_query_metadata = _fetch_query_metadata(query_id = query_stats["queryId"])
	return {"queryId": query_stats["queryId"], "results": fetch_query_metadata}

if __name__ == "__main__":
	parser = argparse.ArgumentParser(description='Prestroid data collection parser')
	parser.add_argument('--presto-host', type=str, nargs='+', default='localhost', help='Presto host url')
	parser.add_argument('--port', type=int, nargs='+', default=8080, help='Presto port')
	parser.add_argument('--user', type=str, nargs='+', default='jkok005', help='Presto user')
	parser.add_argument('--catalog', type=str, nargs='+', default='tpcds', help='Presto catalog')
	parser.add_argument('--schema', type=str, nargs='+', default='sf1', help='Presto schema')
	parser.add_argument('--results', type=str, nargs='+', default='profile', help='Base directory to store all profiling results')
	args = parser.parse_args()

	logging.info(args)
	GLOBAL_ARGS = args

	conn 	= prestodb.dbapi.connect( 
        		host = GLOBAL_ARGS.presto_host, 
        		port = GLOBAL_ARGS.port, 
        		user = GLOBAL_ARGS.user, 
        		catalog = GLOBAL_ARGS.catalog, 
        		schema = GLOBAL_ARGS.schema)   

	query 	= "SELECT * FROM store_returns LIMIT 100" 
	res 	= profile_query(query = query, conn = conn)
	print(res)