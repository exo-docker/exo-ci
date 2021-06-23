#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk11-maven38 cat || ((i++))

exit $i