#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk7-maven30 cat || ((i++))

exit $i