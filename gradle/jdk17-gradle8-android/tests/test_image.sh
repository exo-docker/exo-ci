#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk17-gradle8-android /bin/cat || ((i++))

exit $i
