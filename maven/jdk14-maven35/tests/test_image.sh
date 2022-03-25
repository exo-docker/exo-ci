#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk14-maven35 cat || ((i++))

exit $i