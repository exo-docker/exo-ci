#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk6 /bin/cat || ((i++))

exit $i