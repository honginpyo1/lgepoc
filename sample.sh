#!/bin/bash
# Program name: sample.sh
date
while read IP
do
    mtr "${IP}" -r -c 10 --csv > /mnt/s3/result.csv
done < /root/sample.sh
