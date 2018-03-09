#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk8-gradle4 /bin/cat || ((i++))

exit $i