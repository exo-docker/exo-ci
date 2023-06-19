#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk17-alpine /bin/cat || ((i++))

exit $i