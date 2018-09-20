#!/bin/bash
if [ -z $1 ]; then 
  echo "ERROR: define a process name" 
  exit 0
fi

if [ -z $2 ]; then
  echo "ERROR: define a process action"
  exit 0
fi

IS_DEFINED=`docker ps -a | grep $1 | wc -l`

if [ $IS_DEFINED -lt 1 ]; then
  exit 1
else
  docker $2 $1
fi

