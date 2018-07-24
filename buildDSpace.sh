#!/bin/sh
BUILDOPT=$1
DEPLOYOPT=$2

echo "======================================="
echo BUILDOPT=$1 (build, rebuild, test, none)
echo DEPLOYOPT=$2 (start, restart, none)
echo DSPACE_SRC=$DSPACE_SRC
echo DPROJ=$DPROJ
echo COMPOSE=$COMPOSE
echo "======================================="

export JAVA_OPTS=-Xmx2048m
export ANT_OPTS=-Xmx2048m
export MAVEN_OPTS=-Xmx2048m

cd $DSPACE_SRC
pwd

if [[ "$BUILDOPT" == "build" ]]
then
  mvn package
elif [[ "$BUILDOPT" == "rebuild" ]]
then
  mvn clean package
elif [[ "$BUILDOPT" == "test" ]]
then
  mvn clean install license:check -Dmaven.test.skip=false -DskipITs=false -B -V -Dsurefire.rerunFailingTestsCount=2
elif [[ "$BUILDOPT" == "none" ]]
then
  echo "no build"
else
  die "Invalid build option"
fi

if [[ "$DEPLOYOPT" == "start" ]]
then
  cd $COMPOSE
  docker-compose -p $DPROJ up -d
  cd $DSPACE_SRC
fi

if [[ "$DEPLOYOPT" != "none" ]]
then
  winpty docker exec -w //dspace-src/dspace/target/dspace-installer ${DPROJ}_dspace_1 ant update clean_backups
  cd $COMPOSE
  docker-compose -p $DPROJ restart
  cd $DSPACE_SRC
fi
