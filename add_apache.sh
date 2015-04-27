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

# 63	Percona Apache Requests GT
# 64	Percona Apache Bytes GT
# 65	Percona Apache CPU Load GT
# 66	Percona Apache Workers GT
# 67	Percona Apache Scoreboard GT


function adding_apache_template {

		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=63 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Apache Requests GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=63 --host-id=${HOST_ID} --graph-title="|host_description| Percona Apache Requests GT"

		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=64 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Apache Bytes GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=64 --host-id=${HOST_ID} --graph-title="|host_description| Percona Apache Bytes GT"

		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=65 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Apache CPU Load GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=65 --host-id=${HOST_ID} --graph-title="|host_description| Percona Apache CPU Load GT"

		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=66 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Apache Workers GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=66 --host-id=${HOST_ID} --graph-title="|host_description| Percona Apache Workers GT"

		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=67 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Apache Scoreboard GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=67 --host-id=${HOST_ID} --graph-title="|host_description| Percona Apache Scoreboard GT"

}


export -f adding_apache_template

adding_apache_template
