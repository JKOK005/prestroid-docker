#!/usr/bin/env bash

build_mode=3 			# 1 - Coordinator only, 2 - Worker only, 3 - Coordinator and worker
coordinator_config="B"
worker_config="A"
jvm_cfg="jvm.config"
node_cfg="config.properties"

if [ ${build_mode} = 1 ] || [ ${build_mode} = 3 ]
then
	echo "Building coordinator image"

	echo "Overwriting config using setting ${coordinator_config}"
	cp ./customized/configs/coordinator/${coordinator_config}/${jvm_cfg} ./default/etc/${jvm_cfg}
	cp ./customized/configs/coordinator/${coordinator_config}/${node_cfg} ./default/etc/${node_cfg}

	echo "Begin building custom image"
	docker build -t jkok005/prestroid-coordinator:latest -f ./customized/Dockerfile .
fi 

if [ ${build_mode} = 2 ] || [ ${build_mode} = 3 ]
then
	echo "Building worker image"

	echo "Overwriting config using setting ${worker_config}"
	cp ./customized/configs/worker/${worker_config}/${jvm_cfg} ./default/etc/${jvm_cfg}
	cp ./customized/configs/worker/${worker_config}/${node_cfg} ./default/etc/${node_cfg}

	echo "Begin building custom image"
	docker build -t jkok005/prestroid-worker:latest -f ./customized/Dockerfile .
fi 
