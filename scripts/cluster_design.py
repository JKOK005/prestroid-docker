import copy
import numpy as np
import random

CLUSTER_SIZE = 10

# 1 - ranged values. Expect min & max keys
# 2 - selection from list. Expect selection key

PERMUTATIONS = {
	"worker" : {
		"task.max-worker-threads" 	: {
			"options" 	: 1,
			"min" 		: 2,
			"max" 		: 10,
			"repr" 		: "{0}"
		},
		"task.min-drivers" 			: {
			"options" 	: 1,
			"min" 		: 4,
			"max" 		: 20,
			"repr" 		: "{0}"
		},
		"task.concurrency" 			: {
			"options" 	: 2,
			"selection" : [2, 4, 8, 16],
			"repr" 		: "{0}"
		},
		"task.writer-count" 		: {
			"options" 	: 2,
			"selection" : [1, 2, 4],
			"repr" 		: "{0}"
		},
		"task.max-partial-aggregation-memory" : {
			"options" 	: 2,
			"selection" : [4, 8, 16, 32],
			"repr" 		: "{0}MB"
		},
		"query.execution-policy" 	: {
			"options" 	: 2,
			"selection" : ["all-at-once", "phased"],
			"repr" 		: "{0}"
		},
		"spill-compression-enabled" : {
			"options" 	: 2,
			"selection" : ["true", "false"],
			"repr" 		: "{0}"
		},
		"node-scheduler.max-splits-per-node" : {
			"options" 	: 2,
			"selection" : [10, 100, 1000],
			"repr" 		: "{0}"
		},
	}, 
	"coordinator" : {}
}

def randomize(initial_list: [int]) -> [int]:
	copied_lst = copy.copy(initial_list)
	random.shuffle(copied_lst)
	return copied_lst

def gen_range(start: int, end: int, chunks: int) -> [int]:
	# Given the start & end range, generate a list of numbers such that each element are equally spaced
	gen_arr = np.linspace(start, end, chunks)
	return [int(i) for i in gen_arr]

def repeat_list(initial_list: [int], length: int) -> [int]:
	# Repeats the list, expanding it to a defined length
	if (len(initial_list) >= length):
		return initial_list
	
	repetitions = int(length / len(initial_list))
	remainder 	= length % len(initial_list)
	return initial_list * repetitions + initial_list[:remainder]

def generate_permutation(config, perm_size: int) -> [int]:
	if config["options"] == 1:
		lst = gen_range(start = config["min"], end = config["max"], chunks = perm_size)
	elif config["options"] == 2:
		lst = repeat_list(initial_list = config["selection"], length = perm_size)
	else:
		raise Exception("{0} not supported".format(config["options"]))
	return randomize(initial_list = lst)

if __name__ == "__main__":
	collector = {
		"worker" 		: {},
		"coordinator" 	: {}
	}

	# Gen worker permutations
	worker_perm = PERMUTATIONS["worker"]
	coordinator_perm = PERMUTATIONS["coordinator"]

	for each_worker_perm_key in worker_perm.keys():
		collector["worker"][each_worker_perm_key] = generate_permutation(config = worker_perm[each_worker_perm_key], perm_size = CLUSTER_SIZE)

	# Gen coordinator permutations
	for each_coord_perm_key in coordinator_perm.keys():
		collector["coordinator"][each_coord_perm_key] = generate_permutation(config = coordinator_perm[each_coord_perm_key], perm_size = CLUSTER_SIZE)

	# Sample 
	for each_cluster in range(CLUSTER_SIZE):
		print("\nConfig {0} ==========================".format(each_cluster))
		
		print("Worker ==========================")
		for each_worker_key in worker_perm.keys():
			value = collector["worker"][each_worker_key][each_cluster]
			str_representation = worker_perm[each_worker_key]["repr"].format(value)
			print("{0}={1}".format(each_worker_key, str_representation))

		print("Coordinator ==========================")
		for each_coord_key in coordinator_perm.keys():
			value = collector["coordinator"][each_coord_key][each_cluster]
			str_representation = coordinator_perm[each_coord_key]["repr"].format(value)
			print("{0}={1}".format(each_coord_key, str_representation))
