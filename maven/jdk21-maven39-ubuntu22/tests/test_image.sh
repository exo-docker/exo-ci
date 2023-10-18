#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk21-maven39-ubuntu22 cat || ((i++))

exit $i