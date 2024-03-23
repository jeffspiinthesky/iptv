#!/bin/bash -e
CHECK=$(grep "iptv" /etc/passwd)
if [ -z "${CHECK}" ]
then
	useradd -d /home/iptv -s /bin/bash -u 1001 -U iptv
	echo "iptv:iptv" | sudo chpasswd
fi

if [ ! -d "/var/local/iptv" ]
then
	mkdir -p /var/local/iptv/TVHeadend/data
	mkdir -p /var/local/iptv/TVHeadend/recordings
	chown -R iptv:iptv /var/local/iptv
fi

