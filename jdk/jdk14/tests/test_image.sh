#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk14 /bin/cat || ((i++))

exit $i