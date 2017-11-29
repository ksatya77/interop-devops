#! /bin/bash

box=`hostname`

case $box in
ist)
  sudo /opt/mule/bin/mule stop
  echo "Starting Database...\n"
  for k in `sudo docker ps -a --format {{.ID}}:{{.Image}} | grep postgres | cut -d: -f1`; do sudo docker restart $k; done
  echo "Starting Mojaloop IST components..\n"
  for k in `sudo docker ps -a --format {{.ID}}`; do sudo docker start $k; done
  sudo /opt/mule/bin/mule start
  ;;
mgmt)
  echo "Nothing to do..\n"
  ;;
*)
  sudo /opt/mule/bin/mule stop
  echo "Starting Database...\n"
  for k in `sudo docker ps -a --format {{.ID}}:{{.Image}} | grep postgres | cut -d: -f1`; do sudo docker restart $k; done
  echo "Starting Mojaloop DFSP components..\n"
  for k in `sudo docker ps -a --format {{.ID}}:{{.Image}} | grep dfsp | cut -d: -f1`; do sudo docker restart $k; done
  sudo /opt/mule/bin/mule start
  echo "Pausing for 30 seconds to allow mule to start...\n"
  sleep 30
  echo "Starting Mojaloop ILP components..\n"
  for k in `sudo docker ps -a --format {{.ID}}:{{.Image}} | grep ilp | cut -d: -f1`; do sudo docker restart $k; done;
  ;;
esac