#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk25-ubuntu24 /bin/cat || ((i++))

exit $i