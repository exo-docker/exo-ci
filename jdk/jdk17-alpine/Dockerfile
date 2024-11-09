# Dockerizing a jdk17 images with:
#
#   - OpenJDK JDK 17
#
# build :   docker build -t exoplatform/ci:jdk17-alpine .
#
FROM exoplatform/ci:base-alpine
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

ENV TERM=xterm

ENV JDK_MAJOR_VERSION=17

# Install OpenJDK Java 17 SDK
RUN wget -P /etc/apk/keys/ https://cdn.azul.com/public_keys/alpine-signing@azul.com-5d5dc44c.rsa.pub 
RUN echo "https://repos.azul.com/zulu/alpine" | tee -a /etc/apk/repositories

RUN apk add --no-cache zulu${JDK_MAJOR_VERSION}-jdk

ENV JAVA_HOME=/usr/lib/jvm/zulu${JDK_MAJOR_VERSION}