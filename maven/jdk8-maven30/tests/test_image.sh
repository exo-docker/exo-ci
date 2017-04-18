#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk8-maven30 cat || ((i++))

exit $i