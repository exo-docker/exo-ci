# Dockerizing a jdk11 images with:
#
#   - OpenJDK JDK 11
#
# build :   docker build -t exoplatform/ci:jdk11 .
#
FROM exoplatform/ci:base
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

ENV TERM=xterm

ENV JDK_MAJOR_VERSION=11

# Install OpenJDK Java 11 SDK
RUN apt-get -qq update && \
    apt-get -qq -y install gnupg ca-certificates curl
RUN curl -s https://repos.azul.com/azul-repo.key | gpg --dearmor -o /usr/share/keyrings/azul.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/azul.gpg] https://repos.azul.com/zulu/deb stable main" | tee /etc/apt/sources.list.d/zulu.list
RUN apt-get -qq update && \
    apt-get -qq -y install zulu${JDK_MAJOR_VERSION}-jdk
RUN apt-get -qq -y autoremove && \
    apt-get -qq -y clean && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/zulu${JDK_MAJOR_VERSION}