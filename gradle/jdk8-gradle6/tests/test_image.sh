#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk8-gradle6 /bin/cat || ((i++))

exit $i