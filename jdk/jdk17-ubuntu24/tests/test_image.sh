#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk17-ubuntu24 /bin/cat || ((i++))

exit $i