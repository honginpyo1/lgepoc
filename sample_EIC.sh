#!/bin/bash
# Program name: sample.sh
HOSTNAME=`hostname -f`
while read IP
do
    echo "\n${IP}" >> /mnt/s3/${HOSTNAME}_result.csv
    mtr "${IP}" -w -r -b -c 100 | tail -2 >> /mnt/s3/${HOSTNAME}_result.csv
done < /root/EIC