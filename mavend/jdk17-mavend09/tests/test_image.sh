#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk17-mavend09 cat || ((i++))

exit $i