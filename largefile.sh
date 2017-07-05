function downloadFromSlowSource ()
{
	timestamp=$((RANDOM%$random_max))
	sleep $timestamp
	return $timestamp
}

function copyPeerToPeer ()
{
	downloadFromSlowSource
	local var=$? 
	echo "Transferring file $1 to node $2 takes $var sec time" | tee $log_file
	echo 
	pv $1 > $2/$1 | tee $log_file
	rm $1
}

