# Dockerizing a jdk17 images with:
#
#   - OpenJDK JDK 17
#
# build :   docker build -t exoplatform/ci:jdk17-alpine .
#
FROM exoplatform/ci:base-alpine
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

ENV TERM xterm

RUN apk add --no-cache openjdk17-jdk