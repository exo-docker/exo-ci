#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk11-mavend08 cat || ((i++))

exit $i