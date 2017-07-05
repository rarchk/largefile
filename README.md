Large File 
=== 

Distributed design experiment on maintaining large file distribution over cluster of machines. 

## Usage 
```bash
# Create large file
dd if=/dev/zero of=file2 bs=4096 count=524288

# Dependency
sudo apt-get install pv

# Run 
source controller.sh `largefile_name`
```
## Design Schema
### Functional Abstractions defined 
1. `downloadFromSlowSource`
2. `copyPeerToPeer`

### Desired properties of system
We need to design a programmable controller with configurable parameters which achieves the following:

1. estimate the completion time and print the estimate 
2. start the distribution process 
3. keep outputting the status updates as it proceeds (e.g. how many nodes remaining, which nodes are currently copying the file from which sources, time elapsed, etc). 
4. print done when done.

### Key componenets of system 
- A dictionary/mbr file which keeps track of all the distributed records i.e `cluster_partitions.txt` 
- pv for intreactive nature and visuals
- algorithms for distribution 
	- linear (one master node handles splitting of file and sequentially transfers the chunk to the node)
		- very easy to implement 
		- transfers could be parallelized 
	- Sharding files (rather than linear, transfer big chunks to the nodes and they distribute the semi files to the slave nodes)
		- introduces the concept of multiple master, so a key-value store is essential to keep track of who is doing what. 
		- On the other hand, will not be reliant on single master and nodes has greater fan-out ratio for bandwith.
	- another case is that where file does not fit on single master, but in that case file can only be represented in distributed way. So we conviniently ignore this use-case.  	
		

