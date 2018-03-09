#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk8-gradle4-android /bin/cat || ((i++))

exit $i
