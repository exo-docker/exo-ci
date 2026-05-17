# Dockerizing a graal21 images with:
#
#   - Graal VM 21
#
# build :   docker build -t exoplatform/ci:graal21-ubuntu24 .
#
FROM exoplatform/ci:base-ubuntu24
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

ENV TERM xterm

ENV JDK_MAJOR_VERSION 21

# Install OpenJDK Java 21 SDK
RUN apt-get -qq update && \
    apt-get -qq -y install gnupg ca-certificates curl

RUN mkdir -p /usr/lib/jvm/graalvm${JDK_MAJOR_VERSION}
RUN curl -fsSL https://download.oracle.com/graalvm/${JDK_MAJOR_VERSION}/latest/graalvm-jdk-${JDK_MAJOR_VERSION}_linux-x64_bin.tar.gz \
    |   tar xzf - -C /usr/lib/jvm/graalvm${JDK_MAJOR_VERSION} --strip-components=1 


ENV JAVA_HOME /usr/lib/jvm/graalvm${JDK_MAJOR_VERSION}
ENV PATH="${PATH}:${JAVA_HOME}/bin"
