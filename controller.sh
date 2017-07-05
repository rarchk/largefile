#!/bin/bash

function compute_average_time ()
{
	avg=0
	for i in $(seq 1 5);
	do
		downloadFromSlowSource
		local var=$?
		avg=$((avg + var));
	done
	avg=$((avg/5 * $npartitons))
	return $avg
}

function node_work ()
{
	mkdir "$cluster_prefix$i"
	partition_file=$(awk 'NR == n' n=$i cluster_partitions.txt | cut -d "'" -f2)
	copyPeerToPeer $partition_file $cluster_prefix$i;
}

function linear_distribution ()
{
	split $1 -b $chunk_size $cluster_prefix  --verbose > cluster_partitions.txt 
	npartitons=$(cat cluster_partitions.txt | wc -l)
	
	echo "This large file '$1' need to be stored in $npartitons nodes"
	echo "================================================="
	echo 

	compute_average_time
	avg=$?
	max=$(($random_max * $npartitons)) 
	
	echo "With present linear algorithm of distribution, it will take on average of $avg sec and maximum of $max sec of time" 
	echo "=================================================" 
	echo 

	echo "Starting Transfer now" 
	echo "=================================================" 
	echo

	for i in $(seq 1 $npartitons);
	do
		if [ "$parallel_flag" -eq 1 ]; then
   			node_work &
   		else 
   			node_work
		fi	
	done
	wait

	echo 
	echo "Done!" 
	echo "=================================================" 
	echo 	
} 

# Importing functional abstractions 
source largefile.sh

# Importing configuration parameters 
source parameters.sh

# Name of large file 
file_name=$1

linear_distribution $file_name | tee -a $log_file

