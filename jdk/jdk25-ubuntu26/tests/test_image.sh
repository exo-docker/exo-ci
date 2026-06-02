#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk25-ubuntu26 /bin/cat || ((i++))

exit $i