#!/bin/bash
# Program name: sample.sh
while read IP
do
    echo "\n${IP}" >> /mnt/s3/result.csv
    mtr "${IP}" -w -r -b -c 100 | tail -2 >> /mnt/s3/result.csv
done < /root/EIC