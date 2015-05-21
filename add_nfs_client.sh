#!/bin/bash
# Usage add_grah.sh ID
# run "php -q add_graphs.php --list-hosts" for ID
# WORK IN PROGRESS

VERBOSE=1

IP=$1


if ! [[ $IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]] ; then     # validate user input to IP address

        echo "Requires a valid IP address as an argument"
	exit

fi

WORKDIR="/usr/share/cacti/cli"
HOST_ID=$(php -q ${WORKDIR}/add_graphs.php --force --list-hosts | grep ${IP} | awk '{print $1}')

# 163	ucd/net - NFS Client

function adding_nfsclient_template {

		if [ ${VERBOSE}=1 ]; then echo ""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=163 --host-id=${HOST_ID} --graph-title="|host_description| NFS Client"

}


export -f adding_nfsclient_template

adding_nfsclient_template
