import copy
import logging
import os
import pandas as pd 
import prestodb
import re
from scripts.writer import DatasetWriter

QUERY_ROOT = os.environ["QUERY_ROOT"]

logging.basicConfig(level = logging.INFO)

def _get_peak_total_memory(results) -> float:
	"""
	Extracts peak total memory in GB
	"""
	def get_multiplier(prefix: str):
		scale = None
		if prefix == "B":
			scale = 1 / 1000000000
		elif prefix == "KB":
			scale = 1 / 1000000
		elif prefix == "MB"
			scale = 1 / 1000
		elif prefix == "GB"
			scale = 1
		elif prefix == "TB"
			scale = 1000
		else:
			raise Exception("Prefix {0} not supported".format(size)) 
		return scale

	peak_memory_str = results["queryStats"]["peakTotalMemoryReservation"]
	value 	= int(re.findall(r'\d+', peak_memory_str)[0])
	prefix 	= re.findall(r'[a-zA-Z]', peak_memory_str)[0]
	return value * get_multiplier(prefix = prefix)

def with_peak_total_memory(df: pd.DataFrame) -> pd.DataFrame:
	"""
	Returns a DF with peak_memory column 

	Expects a column `results` containing profiled query results
	"""
	_tmp_df = copy.copy(df)
	_tmp_df["peak_memory"] = df.apply(lambda row: _get_peak_total_memory(row = row["results"]))
	return _tmp_df


def _get_execution_time(results) -> float:
	"""
	Extracts execution time in min
	"""
	def get_multiplier(prefix: str):
		scale = None
		if prefix == "s":
			scale = 60
		elif prefix == "m":
			scale = 1
		elif prefix == "h"
			scale = 1 / 60
		else:
			raise Exception("Prefix {0} not supported".format(size)) 
		return scale

	execution_time_str = results["queryStats"]["executionTime"]
	value 	= float(re.findall(r'\d+\.\d+', execution_time_str)[0])
	prefix 	= re.findall(r'[a-zA-Z]', execution_time_str)[0]
	return value * get_multiplier(prefix = prefix)

def with_execution_time(df: pd.DataFrame) -> pd.DataFrame:
	"""
	Returns a DF with execution_time column

	Expects a column `results` containing profiled query results
	"""
	_tmp_df = copy.copy(df)
	_tmp_df["execution_time"] = df.apply(lambda row: _get_execution_time(row["results"]))
	return _tmp_df


def _prefix_explain(query: str) -> str:
	"""
	Prefixes a query with EXPLAIN (FORMAT GRAPHVIZ)
	"""
	return "EXPLAIN (FORMAT GRAPHVIZ)\n {0}".format(query)

def _execute(query: str, schema: str):
	conn 	= prestodb.dbapi.connect( 
        		host = GLOBAL_ARGS.presto_host, 
        		port = GLOBAL_ARGS.port, 
        		user = GLOBAL_ARGS.user, 
        		catalog = GLOBAL_ARGS.catalog, 
        		schema = schema)   
	cur = conn.cursor()
	cur.execute(query)
	result = cur.fetchone()
	cur.close()
	return result[0]

def _get_logical_plan(query_name: str, schema: str) -> str:
	"""
	Extracts logical plan as a digraph string

	This is done using Presto's EXPLAIN (FORMAT GRAPHVIZ)
	"""
	query_path = os.path.join(QUERY_ROOT, query_name)
	with open(query_path, "r") as f:
		executable_query = _prefix_explain(query = f.read())
		executable_query = executable_query.replace(";", "")
	result = _execute(query = executable_query, schema = schema)
	return result

def with_logical_plan(df: pd.DataFrame) -> pd.DataFrame:
	"""
	Returns a DF with logical_plan column

	Expects columns `query_name` / `schema` containing which template query was executed under which schema
	"""
	_tmp_df = copy.copy(df)
	_tmp_df["logical_plan"] = df.apply(lambda row: _get_logical_plan(query_name = row["query_name"], schema = row["schema"]))
	return _tmp_df

if __name__ == "__main__":
	parser = argparse.ArgumentParser(description='Prestroid data collection parser')
	parser.add_argument('--presto-host', type=str, nargs='?', default='localhost', help='Presto host url')
	parser.add_argument('--port', type=int, nargs='?', default=8080, help='Presto port')
	parser.add_argument('--user', type=str, nargs='?', default='jkok005', help='Presto user')
	parser.add_argument('--catalog', type=str, nargs='?', default='tpcds', help='Presto catalog')
	args = parser.parse_args()

	logging.info(args)
	GLOBAL_ARGS = args