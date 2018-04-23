#!/bin/bash
############################################################
# $Name:         zabbix_linux_plugins.sh
# $Version:      v1.0
# $Function:     zabbix plugins
# $Author:       Jason Zhao
# $organization: www.unixhot.com
# $Create Date:  2014-08-10
# $Description:  Monitor Linux Service Status
############################################################




memcached_status_fun(){
	M_PORT=$1
	M_COMMAND=$2
	echo -e "stats\nquit" | nc 127.0.0.1 "$M_PORT" | grep "STAT $M_COMMAND " | awk '{print $3}'
}



