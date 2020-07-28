#!/bin/bash

if [[ -z $1 ]]; then
	echo -e "$ ~/recon.sh DOMAIN"
else
	#Making Directories
	mkdir -p $(pwd)/tmp
	mkdir -p $(pwd)/recon
	mkdir -p $(pwd)/recon/$1

	echo -e "\t--------------------\t"
	echo -e "\t     Subdomains     \t"
	echo -e "\t--------------------\t"

	#Subdomains
	$(pwd)/Tools/subdomain.sh $1 > $(pwd)/recon/$1/Subdomains.txt

	#Removing Trash
	rm -rf $(pwd)/tmp

	#SendNotification
	SubdomainsCount=$(wc -l $(pwd)/recon/$1/Subdomains.txt | cut -d ' ' -f1)
	Notification="Total $SubdomainsCount Subdomains found for $1"
	$(pwd)/sendUpdates.sh "$Notification"
fi