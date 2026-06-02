#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk21-maven39-ubuntu26 cat || ((i++))

exit $i