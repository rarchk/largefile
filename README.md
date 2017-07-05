Large File 
=== 

Distributed design experiment on maintaining large file distribution over cluster of machines. 

## Functional Abstractions defined 
1. `downloadFromSlowSource`
2. `copyPeerToPeer`

## Desired properties of system
We need to design a programmable controller with configurable parameters which achieves the following:

1. estimate the completion time and print the estimate 
2. start the distribution process 
3. keep outputting the status updates as it proceeds (e.g. how many nodes remaining, which nodes are currently copying the file from which sources, time elapsed, etc). 
4. print done when done.

## Key componenets of system 
- A dictionary/mbr file which keeps track of all the distributed records. 
- pv for intreactive nature and visuals 

## Dependency 
- `sudo apt-get install pv`

```bash 
source controller.sh largefile
```