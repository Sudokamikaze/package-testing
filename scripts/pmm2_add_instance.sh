#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "This script requires product parameter: mysql or mongodb !"
  echo "Usage: ./pmm_service_check.sh <prod>"
  exit 1
fi

if [ "$1" = "mysql" ]; then
  if [[ $(pmm-admin add mysql --password='U?fY)9s7|3gxUm') ]]; then
    echo "All Good"
  else
    echo "MySQL Instance Not added for Monitoring"
    exit 1
  fi
elif [ "$1" = "mongodb" ]; then
  if [ $(pmm-admin add mongodb) ]; then
    echo "All Good"

  else
    echo "MongoDb Instance Not added for Monitoring"
    exit 1
  fi
else
  echo "Illegal product selected!"
  exit 1
fi
