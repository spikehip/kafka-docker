#!/bin/bash
if [ -z $NETWORK_NAME ]; then 
  echo "define a network name" 
  exit 1
fi

IS_DEFINED=`docker network ls | grep $NETWORK_NAME | wc -l`

if [ $IS_DEFINED -lt 1 ]; then
  echo "creating network"
  docker network create $NETWORK_NAME
else
  echo "network ok"
fi

