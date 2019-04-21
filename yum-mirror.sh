#!/bin/bash
releasever="7.6.1810"
if [ -f /var/lock/subsys/rsync_updates ]; then
   echo "Updates via rsync already running."
    exit 0
fi
if [ -d /share/centos ] ; then
    touch /var/lock/subsys/rsync_updates
    rsync  -avSHP --delete --exclude "local*" --exclude-from=/root/exclude.list rsync://mirror.tuna.tsinghua.edu.cn/centos/$releasever /share/centos
    /bin/rm -f /var/lock/subsys/rsync_updates
else
    echo "Target directory /share/centos/$releasever not present."
fi
