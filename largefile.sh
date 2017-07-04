function downloadFromSlowSource ()
{
	timestamp=$((RANDOM%7))
	sleep $timestamp
	return $timestamp
}

function copyPeerToPeer ()
{
	downloadFromSlowSource
	local var=$? 
	echo "Copying took $var sec time"
	cp $1 $2
}

