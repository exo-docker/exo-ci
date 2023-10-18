#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:base-ubuntu22 /bin/cat || ((i++))

exit $i