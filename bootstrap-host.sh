#!/bin/sh

# make this into a playbook instead, should be possible

# install python & sudo
# setup do account
# add to sudo group
# add authorized_keys

if [ $# -ne 1 ]; then
	echo "Usage: $0 <host>"
	exit 1;
fi

host=$1
rootcmds="apt-get update && apt-get install -y python3 sudo && /sbin/usermod -a -G sudo do"

ssh "do@$host" "su -c \"$rootcmds\""

ssh-copy-id "do@$host"
