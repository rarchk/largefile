#!/bin/bash

function distribution ()
{
	echo "I want to distribute $1"

} 

# Importing functional abstractions 
#source largefile.sh

# Importing configuration parameters 
source parameters.sh

echo $chunk_size

# Name of large file 
file_name=$1

# downloadFromSlowSource
# copyPeerToPeer 1 3

distribution $file_name

