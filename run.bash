#!/usr/bin/env bash

echo "### THIS SCRIPT WILL WORK ON LINUX ONLY!!! ###"

SCRIPT="`readlink -e $0`"
SCRIPTPATH="`dirname $SCRIPT`"
echo "-- SCRIPT_PATH: --"
echo $SCRIPTPATH

MODULENAME="texlipse"

#install docker if not done before
echo "try install docker if not exists"
if which docker >/dev/null; then
    echo "docker exists: wont install"
    service docker start
else
  echo "docker not exists: i will install"
  curl -sSL https://get.docker.com/ | sh
fi


#folders
chmod -R 777  $SCRIPTPATH/workspace
chmod -R 777  $SCRIPTPATH/doNotEdit/eclipse

#delete previous container
echo "delete old container"
docker stop $MODULENAME
docker rm $MODULENAME

#build docker image
echo "delete old image: $MODULENAME"
#docker rmi $MODULENAME
echo "building image"
docker build -t $MODULENAME $SCRIPTPATH/doNotEdit/docker


#allow xHost
xhost +

#make and run container
echo "make container"
docker run -it --name $MODULENAME \
--privileged \
-v $SCRIPTPATH/doNotEdit/workspace:/workspace \
-v $SCRIPTPATH/bachelorarbeit:/workspace/bachelorarbeit \
-v $SCRIPTPATH/doNotEdit/eclipse:/eclipse \
-v /tmp/.X11-unix/:/tmp/.X11-unix/ \
-v /dev/shm:/dev/shm \
-e DISPLAY=${DISPLAY} \
 $MODULENAME

#disallow xHost
xhost -
