# Dockerizing a jdk11 images with:
#
#   - OpenJDK JDK 11
#
# build :   docker build -t exoplatform/ci:jdk11 .
#
FROM exoplatform/ci:base
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

ENV TERM xterm

ENV JDK_VERSION_MAJOR 11
ENV JDK_VERSION_UPDATE 14

ENV JDK_VERSION ${JDK_VERSION_MAJOR}.0.${JDK_VERSION_UPDATE}
# Install OpenJdk Java 11 SDK
# FIXME: Use openjdk bundle instead of apt packages
RUN add-apt-repository -y ppa:openjdk-r/ppa && apt-get update && apt-get -y install ca-certificates-java openjdk-11-jdk=${JDK_VERSION}* && rm -rf /var/lib/apt
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64