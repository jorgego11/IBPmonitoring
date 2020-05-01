#!/bin/bash

set -e

if [ "$#" -ne 1 ]; then
  echo "Please run 'bash generate-prometheus.sh <project-name>'" >&2
  echo "Example: bash generate-prometheus.sh ibp" >&2
  exit 1
fi

echo -e "Environment variables:"
echo "PROJECT NAME=$1"

rm -rf proj-$1
echo -e "Create project folder 'proj-$1'"
mkdir -p proj-$1

echo -e "Convert template files to project folder 'proj-$1'"
sed -e "s/_PROJECT_/$1/g"  ./template/clusterrolebinding-template.yaml > ./proj-$1/clusterrolebinding.yaml
sed -e "s/_PROJECT_/$1/g"  ./template/prometheus-template.yaml > ./proj-$1/prometheus.yaml
sed -e "s/_PROJECT_/$1/g"  ./template/secrets-template.yaml > ./proj-$1/secrets.yaml
sed -e "s/_PROJECT_/$1/g"  ./template/service-route-template.yaml > ./proj-$1/service-route.yaml
sed -e "s/_PROJECT_/$1/g"  ./template/serviceaccount-template.yaml > ./proj-$1/serviceaccount.yaml
sed -e "s/_PROJECT_/$1/g"  ./template/servicemonitor-template.yaml > ./proj-$1/servicemonitor-template.yaml
sed -e "s/_PROJECT_/$1/g"  ./template/prometheus-datasources-template.yaml > ./proj-$1/prometheus-datasources.yaml
echo -e "Done!!! Please view config files in folder 'proj-$1'"
