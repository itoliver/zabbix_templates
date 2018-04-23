#!/bin/bash
############################################################
# $Name:         tcp_status.sh
# $Version:      v1.0
# $Function:     TCP Status
# $Author:       xuliangwei
# $organization: www.xuliangwei.com
# $Create Date:  2016-06-23
# $Description:  Monitor TCP Service Status
############################################################
[ $# -ne 1 ] && echo "Usage:CLOSE-WAIT|CLOSED|CLOSING|ESTAB|FIN-WAIT-1|FIN-WAIT-2|LAST-ACK|LISTEN|SYN-RECV SYN-SENT|TIME-WAIT" && exit 1


tcp_status_fun(){
	TCP_STAT=$1
	ss -ant | awk 'NR>1 {++s[$1]} END {for(k in s) print k,s[k]}' > /tmp/ss.txt
	TCP_STAT_VALUE=$(grep "$TCP_STAT" /tmp/ss.txt | cut -d ' ' -f2)
	if [ -z "$TCP_STAT_VALUE" ];then
		TCP_STAT_VALUE=0
	fi
	echo $TCP_STAT_VALUE
}


tcp_status_fun $1;
