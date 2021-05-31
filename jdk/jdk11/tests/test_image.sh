#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk11 /bin/cat || ((i++))

exit $i