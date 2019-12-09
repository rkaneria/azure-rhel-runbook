#!/bin/sh

PROXYIP=$1
PORT=$2

set -e

#package manager
echo "proxy=http://"$PROXYIP:$PORT >>/etc/yum.conf

#exception for UDR-reachable Microsoft RHUI repos
sed -i.bak 's#^\(\[.*\]\)#\1\nproxy=_none_#' /etc/yum.repos.d/rh-cloud-eus.repo
