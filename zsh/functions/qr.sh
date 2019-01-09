qrnet () {
	echo "WIFI:S:$1;T:WPA;$2;;"|curl -F-=\<- qrenco.de
}
