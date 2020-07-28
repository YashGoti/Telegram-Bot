#!/bin/bash

banner(){
	echo -e "\t  ______     ______             βeta v1.0\t"
	echo -e "\t /_  __/__  / / __ \___  _________  ____ \t"
	echo -e "\t  / / / _ \/ / /_/ / _ \/ ___/ __ \/ __ \/\t"
	echo -e "\t / / /  __/ / _, _/  __/ /__/ /_/ / / / /\t"
	echo -e "\t/_/  \___/_/_/ |_|\___/\___/\____/_/ /_/ \t"
	echo -e "\t                                         \t"
	echo -e "\t            By @_YashGoti_               \t"
}

#Get Old Timestemp from logs
timestemp=$(cat $(pwd)/logs.txt | cut -d ',' -f1 | tail -1)

#Get New Timestemp for logs
token=$(cat ./keys.txt | cut -d ',' -f1)
date=$(curl -s -X POST https://api.telegram.org/bot$token/getUpdates | jq -r .result[].message.date | tail -1)
text=$(curl -s -X POST https://api.telegram.org/bot$token/getUpdates | jq -r .result[].message.text | tail -1)

#Setting New Timestemp & Message to logs
echo $date,$text >> $(pwd)/logs.txt

if [[ $date == $timestemp ]]; then
	banner
	#No Action will Performe
	echo -e "Nothing New : $timestemp --> $date"
elif [[ $date != $timestemp ]]; then
	banner
	#Log into Terminal
	TARGET=$(cat $(pwd)/logs.txt | cut -d ',' -f2 | cut -d '"' -f2 | tail -1)
	echo -e "Something New : $timestemp --> $date"
	echo -e "Starting Recon on $text"

	#Start Your Script Here
	$(pwd)/recon.sh $TARGET
fi