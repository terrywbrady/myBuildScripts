#!/bin/sh
# CD to docker-compose dir
export DOCKER_OWNER=dspace
export DOCKER_OWNER=terrywbrady
export DPROJ=test-image


function checkImage {

  removeVols
  export DSPACE_VER=$1
  docker-compose -p $DPROJ up -d
  echo " ===== ${DSPACE_VER} ===== "
  docker exec ${DPROJ}_dspace_1 //dspace/bin/dspace version | egrep "DSpace version:|JRE:"
  checkUrl foo
  checkUrl xmlui
  checkUrl oai/request
  checkUrl solr
  checkUrl rest
  echo " ===== ===== ===== "
  docker-compose -p $DPROJ down

}

function checkUrl {
  URL="http://localhost:8080/$1"
  echo "  ---> ${URL} "
  curl -s -I -L $URL | grep "^HTTP"
}

function removeVols {
  vols=`docker volume ls --format "{{.Labels}};{{.Name}}"|grep "com.docker.compose.project=${DPROJ}"|cut -d';' -f2`
  for vol in $vols
  do
    docker volume rm $vol
  done
}

checkImage dspace-5_x-jdk7

exit
checkImage dspace-7_x-jdk8
checkImage dspace-7_x-jdk8-test
checkImage dspace-6_x-jdk8
checkImage dspace-6_x-jdk8-test
checkImage dspace-5_x-jdk8
checkImage dspace-5_x-jdk8-test
checkImage dspace-5_x-jdk7
checkImage dspace-5_x-jdk7-test
checkImage dspace-4_x-jdk7
checkImage dspace-4_x-jdk7-test
