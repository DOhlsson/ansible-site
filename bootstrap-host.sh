#!/bin/sh

# TODO make this into a playbook instead

if [ $# -ne 1 ]; then
	echo "Usage: $0 <host>"
	exit 1;
fi

host=$1
rootcmds="apt-get update && apt-get install -y python3 sudo && /sbin/usermod -a -G sudo do"

ssh-copy-id "do@$host"

ssh "do@$host" "su -c \"$rootcmds\""
