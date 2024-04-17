# Dockerizing a jdk21 images with:
#
#   - OpenJDK JDK 21
#
# build :   docker build -t exoplatform/ci:jdk21-ubuntu22 .
#
FROM exoplatform/ci:base-ubuntu22
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

ENV TERM xterm

ENV JDK_MAJOR_VERSION 21

# Install OpenJDK Java 21 SDK
RUN apt-get -qq update && \
    apt-get -qq -y install gnupg ca-certificates curl
RUN curl -s https://repos.azul.com/azul-repo.key | gpg --dearmor -o /usr/share/keyrings/azul.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/azul.gpg] https://repos.azul.com/zulu/deb stable main" | tee /etc/apt/sources.list.d/zulu.list
RUN apt-get -qq update && \
    apt-get -qq -y install zulu${JDK_MAJOR_VERSION}-jdk
RUN apt-get -qq -y autoremove && \
    apt-get -qq -y clean && \
    rm -rf /var/lib/apt/lists/*