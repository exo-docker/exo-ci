#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:base-alpine /bin/cat || ((i++))

exit $i