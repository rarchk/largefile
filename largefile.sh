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
	echo "Transferring file $1 to node $2 takes $var sec time" 
	echo 
	pv $1 > $2/$1 
	rm $1
}

