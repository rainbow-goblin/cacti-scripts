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

function adding_innodb_template {

	#76	Percona InnoDB Buffer Pool GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=76 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Buffer Pool GT"

	#77	Percona InnoDB I/O GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=77 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB I/O GT"

	#78	Percona InnoDB Insert Buffer GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=78 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Insert Buffer GT"

	#79	Percona InnoDB Insert Buffer Usage GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=79 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Insert Buffer Usage GT"

	#80	Percona InnoDB Semaphores GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=80 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Semaphores GT"

	#81	Percona InnoDB Row Operations GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=81 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Row Operations GT"

	#92	Percona InnoDB Buffer Pool Activity GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=92 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Buffer Pool Activity GT"

	#93	Percona InnoDB I/O Pending GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=93 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB I/O Pending GT"

	#94	Percona InnoDB Log GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=94 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Log GT"

	#96	Percona InnoDB Transactions GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=96 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Transactions GT"

	#97	Percona InnoDB Transactions Active/Locked GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=97 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Transactions Active/Locked GT"

	#100	Percona InnoDB Memory Allocation GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=100 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Memory Allocation GT"

	#101	Percona InnoDB Adaptive Hash Index GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=101 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Adaptive Hash Index GT"

	#102	Percona InnoDB Internal Hash Memory Usage GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=102 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Internal Hash Memory Usage GT"

	#103	Percona InnoDB Tables In Use GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=103 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Tables In Use GT"

	#104	Percona InnoDB Current Lock Waits GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=104 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Current Lock Waits GT"

	#105	Percona InnoDB Lock Structures GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=105 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Lock Structures GT"

	#106	Percona InnoDB Checkpoint Age GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=106 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Checkpoint Age GT"

	#107	Percona InnoDB Row Lock Time GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=107 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Row Lock Time GT"

	#108	Percona InnoDB Row Lock Waits GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=108 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Row Lock Waits GT"

	#109	Percona InnoDB Semaphore Waits GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=109 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Semaphore Waits GT"

	#110	Percona InnoDB Semaphore Wait Time GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=110 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Semaphore Wait Time GT"

	#116	Percona InnoDB Buffer Pool Efficiency GT
	php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=116 --host-id=${HOST_ID} --graph-title="|host_description| Percona InnoDB Buffer Pool Efficiency GT"

}


export -f adding_innodb_template

adding_innodb_template

