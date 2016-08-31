#!/bin/bash

${EXO_CI_DATA_DIR}/r10k-install-module.sh
find ${EXO_CI_DATA_DIR} -name '*.pp' | xargs -n 1 -t puppet parser validate

