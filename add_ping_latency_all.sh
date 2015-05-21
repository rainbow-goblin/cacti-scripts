#!/bin/bash

for i in $(php -q /usr/share/cacti/cli/add_graphs.php --list-hosts|awk '{print $1}')
do
	php -q /usr/share/cacti/cli/add_graphs.php --graph-type=cg --graph-template-id=7 --host-id=${i} --graph-title="|host_description| Ping latency"
done
