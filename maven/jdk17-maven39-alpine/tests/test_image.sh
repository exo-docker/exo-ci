#!/bin/bash

i=0
time dgoss run -it exoplatform/ci:jdk17-maven39-alpine cat || ((i++))

exit $i