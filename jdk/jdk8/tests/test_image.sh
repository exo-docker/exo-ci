#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk8 /bin/cat || ((i++))

exit $i