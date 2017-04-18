#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:base /bin/cat || ((i++))

exit $i