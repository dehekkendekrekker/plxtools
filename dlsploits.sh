#!/bin/bash
SEARCH_STRING=$1
NEEDED_BINS=("wget" "sed" "xargs" "awk" "poep")

usage() {
	echo "Usage: $0 <search string>"
	exit
}

if [ -z $SEARCH_STRING ]
then
	usage
fi

URLS=$(searchsploit $SEARCH_STRING -w -t | awk -F'|' '{print $2}' | awk {'gsub(/ /,""); print'} | grep "https")


echo "-------------------------------"
for url in $URLS
do
	echo "$url"
done
echo "-------------------------------"

read -p "Any key to continue" x

for url in $URLS
do
	wget $url
done
