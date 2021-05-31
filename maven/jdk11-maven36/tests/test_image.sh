#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk11-maven36 cat || ((i++))

exit $i