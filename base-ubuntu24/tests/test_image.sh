#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:base-ubuntu24 /bin/cat || ((i++))

exit $i