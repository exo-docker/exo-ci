#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:base-ubuntu20 /bin/cat || ((i++))

exit $i