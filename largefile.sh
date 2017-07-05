function downloadFromSlowSource ()
{
	timestamp=$((RANDOM%9))
	sleep $timestamp
	return $timestamp
}

function copyPeerToPeer ()
{
	downloadFromSlowSource
	local var=$? 
	echo "Transferring file $1 to node $2 takes $var sec time"
	pv $1 > $2/$1
}

