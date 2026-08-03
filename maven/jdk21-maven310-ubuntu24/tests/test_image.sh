#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk21-maven310-ubuntu24 cat || ((i++))

exit $i
