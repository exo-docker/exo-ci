#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk17-maven36 cat || ((i++))

exit $i