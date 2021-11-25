#!/bin/bash

outfile=$1

if [ -z "$outfile" ]; then
    echo "$0 <output tgz>"
    exit 1
fi

echo "Backup images"
docker images --format "{{.Repository}}:{{.Tag}}" > image_list.txt
cat image_list.txt

docker save $(cat image_list.txt) | gzip > ${outfile}
