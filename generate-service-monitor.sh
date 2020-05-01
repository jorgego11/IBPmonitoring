#!/bin/bash

set -e

if [ "$#" -ne 4 ]; then
  echo "Please run 'bash generate-service-monitor.sh <project-name> <msp> <port> <matchLabels>'" >&2
  echo "Example: bash generate-service-monitor.sh ibp org1msp 9443 'orgname: org1msp'" >&2
  exit 1
fi

echo -e "Environment variables:"
echo "PROJECT NAME=$1"
echo "MSP=$2"

echo -e "Convert service monitor template file to project folder '$1', MSP '$2'"
sed -e "s/_PROJECT_/$1/g" -e "s/_MSP_/$2/g" -e "s/_PORT_/$3/g" -e "s/_MATCH_LABEL_/$4/g" ./proj-$1/servicemonitor-template.yaml > ./proj-$1/$2-servicemonitor.yaml
echo -e "Done!!! Please view config file at './proj-$1/$2-servicemonitor.yaml'"