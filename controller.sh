#!/bin/bash

function start_distribution ()
{
	split $1 -b $chunk_size $cluster_prefix  --verbose > cluster_partitions.txt 
	npartitons=$(cat cluster_partitions.txt | wc -l)
	
	echo "This large file $1 need to be stored in $npartitons nodes"
	echo "========================================================="
	echo 
	echo "Starting Transfer now"

	for i in $(seq 1 $npartitons);
	do
		mkdir "$cluster_prefix$i"
		partition_file=$(awk 'NR == n' n=$i cluster_partitions.txt | cut -d "'" -f2)
		copyPeerToPeer $partition_file $cluster_prefix$i;
	done	


} 

# Importing functional abstractions 
source largefile.sh

# Importing configuration parameters 
source parameters.sh

echo $chunk_size

# Name of large file 
file_name=$1

# downloadFromSlowSource
# copyPeerToPeer 1 3

start_distribution $file_name 

