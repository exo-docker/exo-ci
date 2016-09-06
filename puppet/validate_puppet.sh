#!/bin/bash

usage() {
  echo "-u : update puppet modules before validation"
}

UPDATE_MODULES=false

while getopts ":uh" opt; do
  case $opt in
    u) 
      echo "Modules will be updated"
      UPDATE_MODULES=true
      ;;
    h)
      usage
      exit 0
      ;;
  esac
done

if [ ${UPDATE_MODULES} == true ]; then
  ${EXO_CI_DATA_DIR}/${JOB_NAME}/r10k-install-module.sh
fi

find ${EXO_CI_DATA_DIR} -name '*.pp' | xargs -n 1 -t puppet parser validate

