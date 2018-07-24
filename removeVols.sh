#!/bin/sh
vols=`docker volume ls --format "{{.Labels}};{{.Name}}"|grep -v "com.docker.compose.project"|cut -d';' -f2`
for vol in $vols
do
  docker volume rm $vol
done
