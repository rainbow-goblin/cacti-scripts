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

#Device is a block device name as it appears in /proc/diskstats and not always seeing from df output especially when logical volumes are in use, e.g. sda3, xvda1, cciss/c0d0p1. It also can be verified from lsblk output. If lsblk is not available use pvdisplay from lvm2 package.
#Volume is a filesystem absolute path as it appears under the first column of df output, e.g. /dev/sda3, /dev/cciss/c0d0p1, /dev/mapper/vglocal01-mysql00.
DISKS=$(ssh -i /etc/cacti/cacti_rsa cacti@${IP}  iostat -d|grep -vE "Linux|Device"|awk '{print $1}')
VOLUMES=$(ssh -i /etc/cacti/cacti_rsa cacti@${IP}  df -mh | grep -E "^/dev" | awk '{print $1}')
NICS=$(ssh -i /etc/cacti/cacti_rsa cacti@${IP}  ifconfig |grep eth |awk '{print $1}')



#if [ ${VERBOSE}=1 ]; then echo "DISKS=${DISKS}"; fi
#if [ ${VERBOSE}=1 ]; then echo "VOLUMES=${VOLUMES}"; fi
#if [ ${VERBOSE}=1 ]; then echo "NICS=${NICS}"; fi


# 124 Percona Interrupts GT 	
# 125 Percona Context Switches GT 	
# 126 Percona Forks GT 	
# 127 Percona CPU Usage GT 	
# 128 Percona Load Average GT 	
# 129 Percona Number of Users GT 	
# 130 Percona Memory GT 	
# 131 Percona Disk Operations GT 	
# 132 Percona Disk Sectors Read/Written GT 	
# 133 Percona Disk Read/Write Time (ms) GT 	
# 134 Percona Disk Read/Write Time per IO Request (ms) GT 	
# 135 Percona Disk Elapsed IO Time (ms) GT 	
# 136 Percona Disk IOPS GT 	
# 137 Percona Disk Space GT 	
# 138 Percona Network Traffic GT 	
# 139 Percona Network Errors GT 	
# 140 Percona Network Connection States GT 	
# 141 Percona Swap Usage GT


function adding_device {

	php -q ${WORKDIR}/add_device.php  --avail=pingsnmp  --ping_method=icmp  --description="cacti-a.gns.co.il" --template=17 --ip=${IP}

}


function adding_linux_template {

		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=124 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Interrupts GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=124 --host-id=${HOST_ID} --graph-title="|host_description| Percona Interrupts GT"
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=125 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Context Switches GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=125 --host-id=${HOST_ID} --graph-title="|host_description| Percona Context Switches GT"
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=126 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Forks GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=126 --host-id=${HOST_ID} --graph-title="|host_description| Percona Forks GT"
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=127 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona CPU Usage GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=127 --host-id=${HOST_ID} --graph-title="|host_description| Percona CPU Usage GT"
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=128 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Load Average GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=128 --host-id=${HOST_ID} --graph-title="|host_description| Percona Load Average GT"
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=129 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Number of Users GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=129 --host-id=${HOST_ID} --graph-title="|host_description| Percona Number of Users GT"
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=130 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Memory GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=130 --host-id=${HOST_ID} --graph-title="|host_description| Percona Memory GT"
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=140 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Network Connection States GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=140 --host-id=${HOST_ID} --graph-title="|host_description| Percona Network Connection States GT"
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=141 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Swap Usage GT\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=141 --host-id=${HOST_ID} --graph-title="|host_description| Percona Swap Usage GT"

	
	# Adding nics graphs with a loop
	for NIC in ${NICS} 
	do
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=138 --host-id=${HOST_ID} --input-fields=\"device=${NIC}\" --graph-title=\"|host_description| - Percona Network Traffic GT - ${NIC} - bits/sec\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=138 --host-id=${HOST_ID} --input-fields="device=${NIC}" --graph-title="|host_description| - Percona Network Traffic GT - ${NIC} - bits/sec"
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=139 --host-id=${HOST_ID} --input-fields=\"device=${NIC}\" --graph-title=\"|host_description| - Percona Network Errors GT - ${NIC}\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=139 --host-id=${HOST_ID} --input-fields="device=${NIC}" --graph-title="|host_description| - Percona Network Errors GT - ${NIC}"
	done

	# Adding disks graphs with a loop
	for HDD in ${DISKS}
	do
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=131 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Disk Operations GT - ${HDD}\"  --input-fields=\"device=${HDD}\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=131 --host-id=${HOST_ID} --graph-title="|host_description| Percona Disk Operations GT - ${HDD}"  --input-fields="device=${HDD}"
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=132 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Disk Sectors Read/Written GT - ${HDD}\"  --input-fields=\"device=${HDD}\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=132 --host-id=${HOST_ID} --graph-title="|host_description| Percona Disk Sectors Read/Written GT - ${HDD}"  --input-fields="device=${HDD}"
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=133 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Disk Read/Write Time (ms) GT - ${HDD}\"  --input-fields=\"device=${HDD}\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=133 --host-id=${HOST_ID} --graph-title="|host_description| Percona Disk Read/Write Time (ms) GT - ${HDD}"  --input-fields="device=${HDD}"
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=134 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Disk Read/Write Time per IO Request (ms) GT - ${HDD}\"  --input-fields=\"device=${HDD}\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=134 --host-id=${HOST_ID} --graph-title="|host_description| Percona Disk Read/Write Time per IO Request (ms) GT - ${HDD}"  --input-fields="device=${HDD}"
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=135 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Disk Elapsed IO Time (ms) GT - ${HDD}\"  --input-fields=\"device=${HDD}\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=135 --host-id=${HOST_ID} --graph-title="|host_description| Percona Disk Elapsed IO Time (ms) GT - ${HDD}"  --input-fields="device=${HDD}"
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=136 --host-id=${HOST_ID} --graph-title=\"|host_description| Percona Disk IOPS GT - ${HDD}\"  --input-fields=\"device=${HDD}\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=136 --host-id=${HOST_ID} --graph-title="|host_description| Percona Disk IOPS GT - ${HDD}"  --input-fields="device=${HDD}"
	done

	# Adding volumes graphs with a loop
	for VOL in ${VOLUMES}
	do
		
		if [ ${VERBOSE}=1 ]; then echo "php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=48 --host-id=${HOST_ID} --input-fields=\"volume=${VOL}\" --graph-title=\"|host_description| - Percona Disk Space GT - ${VOL}\""; fi
		php -q ${WORKDIR}/add_graphs.php --force --graph-type=cg --graph-template-id=137 --host-id=${HOST_ID} --input-fields="volume=${VOL}" --graph-title="|host_description| - Percona Disk Space GT - ${VOL}"
	done

}


export -f adding_device
export -f adding_linux_template


adding_linux_template



