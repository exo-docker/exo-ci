#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk11-maven32 cat || ((i++))

exit $i