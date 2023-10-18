#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk21-ubuntu22 /bin/cat || ((i++))

exit $i