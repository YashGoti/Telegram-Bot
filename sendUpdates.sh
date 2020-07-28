#!/bin/bash

if [[ -z $1 ]]; then
	echo "No Notification Detected !"
else
	notification=$1
	token=$(cat ./keys.txt | cut -d ',' -f1)
	chatid=$(cat ./keys.txt | cut -d ',' -f2)
	curl -s -X POST https://api.telegram.org/bot$token/sendMessage -d chat_id=$chatid -d text="$notification" > /dev/null
fi