#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk17-maven39-ubuntu20 cat || ((i++))

exit $i