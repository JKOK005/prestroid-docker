import argparse
import ast
import copy
import glob
import logging
import os
import pandas as pd 
import prestodb
import re
from tqdm import tqdm
from scripts.writer import DatasetWriter

QUERY_ROOT = os.environ["QUERY_ROOT"]

logging.basicConfig(level = logging.INFO)

tqdm.pandas()

data_writer = DatasetWriter()

def _get_peak_total_memory(results) -> float:
	"""
	Extracts peak total memory in MB
	"""
	def get_multiplier(prefix: str):
		scale = None
		if prefix == "B":
			scale = 1 / 1000000
		elif prefix == "KB":
			scale = 1 / 1000
		elif prefix == "MB":
			scale = 1 / 1
		elif prefix == "GB":
			scale = 1000
		elif prefix == "TB":
			scale = 1000000
		else:
			raise Exception("Prefix {0} not supported".format(size)) 
		return scale

	results_dict = ast.literal_eval(results)
	peak_memory_str = results_dict["queryStats"]["peakTotalMemoryReservation"]
	value 	= int(re.findall(r'\d+', peak_memory_str)[0])
	prefix 	= re.findall(r'[a-zA-Z]', peak_memory_str)[0]
	return value * get_multiplier(prefix = prefix)

def with_peak_total_memory(df: pd.DataFrame) -> pd.DataFrame:
	"""
	Returns a DF with peak_memory column 

	Expects a column `results` containing profiled query results
	"""
	_tmp_df = copy.copy(df)
	_tmp_df["peak_memory"] = _tmp_df.progress_apply(lambda row: _get_peak_total_memory(results = row["results"]), axis = 1)
	return _tmp_df


def _get_execution_time(results) -> float:
	"""
	Extracts execution time in min
	"""
	def get_multiplier(prefix: str):
		scale = None
		if prefix == "s":
			scale = 1/60
		elif prefix == "m":
			scale = 1
		elif prefix == "h":
			scale = 60
		else:
			raise Exception("Prefix {0} not supported".format(prefix)) 
		return scale

	results_dict = ast.literal_eval(results)
	execution_time_str = results_dict["queryStats"]["executionTime"]
	value 	= float(re.findall(r'\d+\.\d+', execution_time_str)[0])
	prefix 	= re.findall(r'[a-zA-Z]', execution_time_str)[0]
	return value * get_multiplier(prefix = prefix)

def with_execution_time(df: pd.DataFrame) -> pd.DataFrame:
	"""
	Returns a DF with execution_time column

	Expects a column `results` containing profiled query results
	"""
	_tmp_df = copy.copy(df)
	_tmp_df["execution_time"] = _tmp_df.progress_apply(lambda row: _get_execution_time(results = row["results"]), axis = 1)
	return _tmp_df

def _get_total_cpu_time(results) -> float:
	"""
	Extracts execution time in min
	"""
	def get_multiplier(prefix: str):
		scale = None
		if prefix == "s":
			scale = 1/60
		elif prefix == "m":
			scale = 1
		elif prefix == "h":
			scale = 60
		elif prefix == "d":
			scale = 60 * 24
		else:
			raise Exception("Prefix {0} not supported".format(prefix)) 
		return scale

	results_dict = ast.literal_eval(results)
	total_time_str = results_dict["queryStats"]["totalCpuTime"]
	value 	= float(re.findall(r'\d+\.\d+', total_time_str)[0])
	prefix 	= re.findall(r'[a-zA-Z]', total_time_str)[0]
	return value * get_multiplier(prefix = prefix)

def with_total_cpu_time(df: pd.DataFrame) -> pd.DataFrame:
	"""
	Returns a DF with execution_time column

	Expects a column `results` containing profiled query results
	"""
	_tmp_df = copy.copy(df)
	_tmp_df["total_cpu_time"] = _tmp_df.progress_apply(lambda row: _get_total_cpu_time(results = row["results"]), axis = 1)
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

def _get_logical_plan(query_name: str, schema: str) -> pd.Series:
	"""
	Extracts logical plan as a digraph string

	This is done using Presto's EXPLAIN (FORMAT GRAPHVIZ)
	"""
	query_path = os.path.join(QUERY_ROOT, query_name)
	with open(query_path, "r") as f:
		executable_query = _prefix_explain(query = f.read())
		executable_query = executable_query.replace(";", "")
	result = _execute(query = executable_query, schema = schema)
	return pd.Series([result, executable_query], index = ["logical_plan", "query"])

def with_logical_plan(df: pd.DataFrame) -> pd.DataFrame:
	"""
	Returns a DF with logical_plan column

	Expects columns `query_name` / `schema` containing which template query was executed under which schema
	"""
	_tmp_df = copy.copy(df)
	_tmp_df[["logical_plan", "query"]] = _tmp_df.progress_apply(lambda row: _get_logical_plan(query_name = row["query_name"], schema = row["schema"]), axis = 1)
	return _tmp_df

def main(df: pd.DataFrame) -> None:
	df_with_logical_plan = with_logical_plan(df = df)
	df_with_peak_mem = with_peak_total_memory(df = df_with_logical_plan)
	df_with_execution_time = with_execution_time(df = df_with_peak_mem)
	df_with_total_cpu_time = with_total_cpu_time(df = df_with_execution_time)
	out_file = os.path.join(GLOBAL_ARGS.out_dir, "metadata.csv")
	logging.info("Write out to {0}".format(out_file))
	data_writer.writeCsv(df = df_with_total_cpu_time, mode = "w", location = out_file)

if __name__ == "__main__":
	parser = argparse.ArgumentParser(description='Prestroid data collection parser')
	parser.add_argument('--presto-host', type=str, nargs='?', default='localhost', help='Presto host url')
	parser.add_argument('--port', type=int, nargs='?', default=8080, help='Presto port')
	parser.add_argument('--user', type=str, nargs='?', default='jkok005', help='Presto user')
	parser.add_argument('--catalog', type=str, nargs='?', default='tpcds', help='Presto catalog')
	parser.add_argument('--profiling_dir', type=str, nargs='?', default='./samples/profiling', help='Profiled results directory')
	parser.add_argument('--out_dir', type=str, nargs='?', default='./samples/extract', help='Extracted metadata directory')
	args = parser.parse_args()

	logging.info(args)
	GLOBAL_ARGS = args

	profiling_files = glob.glob(GLOBAL_ARGS.profiling_dir + "/*.csv")
	logging.info("Identified profiling files: {0}".format(profiling_files))

	columns = ["results", "coordinator_config", "worker_config", "query_name", "schema", "queryId"]
	all_df 	= [pd.read_csv(each_df, names = columns) for each_df in profiling_files]
	profiling_df = pd.concat(all_df)
	profiling_df = profiling_df[~profiling_df.results.isna()]
	main(df = profiling_df)