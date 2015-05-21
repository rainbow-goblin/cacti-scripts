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

# GRANT SUPER, PROCESS ON *.* TO 'cactiuser'@'%' IDENTIFIED BY "PASSWORD";



function adding_mysql_template {

		# 82	Percona MySQL Table Locks GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=82 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Table Locks GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=82 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Table Locks GT"

		# 83	Percona MySQL Connections GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=83 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Connections GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=83 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Connections GT"

		# 84	Percona MySQL Replication GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=84 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Replication GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=84 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Replication GT"

		# 85	Percona MySQL Query Cache GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=85 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Query Cache GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=85 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Query Cache GT"

		# 86	Percona MySQL Query Cache Memory GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=86 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Query Cache Memory GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=86 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Query Cache Memory GT"

		# 87	Percona MySQL Command Counters GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=87 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Command Counters GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=87 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Command Counters GT"

		# 88	Percona MySQL Select Types GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=88 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Select Types GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=88 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Select Types GT"

		# 89	Percona MySQL Sorts GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=89 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Sorts GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=89 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Sorts GT"

		# 90	Percona MySQL Temporary Objects GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=90 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Temporary Objects GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=90 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Temporary Objects GT"

		# 91	Percona MySQL Network Traffic GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=91 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Network Traffic GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=91 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Network Traffic GT"

		# 95	Percona MySQL Binary/Relay Logs GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=95 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Binary/Relay Logs GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=95 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Binary/Relay Logs GT"

		# 98	Percona MySQL Files and Tables GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=98 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Files and Tables GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=98 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Files and Tables GT"

		# 99	Percona MySQL Threads GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=99 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Threads GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=99 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Threads GT"

		# 111	Percona MySQL Processlist GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=111 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Processlist GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=111 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Processlist GT"

		# 112	Percona MySQL Transaction Handler GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=112 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Transaction Handler GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=112 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Transaction Handler GT"

		# 113	Percona MySQL Handlers GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=113 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Handlers GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=113 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Handlers GT"

		# 114	Percona MySQL Query Time Histogram (Count) GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=114 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Query Time Histogram (Count) GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=114 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Query Time Histogram (Count) GT"

		# 115	Percona MySQL Query Response Time (Microseconds) GT
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=115 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona MySQL Query Response Time (Microseconds) GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=115 --host-id=${HOST_ID} --graph-title="|host_description| Percona MySQL Query Response Time (Microseconds) GT"


}


export -f adding_mysql_template

adding_mysql_template

