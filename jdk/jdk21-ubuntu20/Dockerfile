# Dockerizing a jdk21 images with:
#
#   - OpenJDK JDK 21
#
# build :   docker build -t exoplatform/ci:jdk21-ubuntu20 .
#
FROM exoplatform/ci:base-ubuntu20
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

ENV TERM xterm

ENV JDK_VERSION 21
ENV JDK_MAJOR_VERSION 21
ENV TEMURIN_SUFFIX 35

ENV JDK_DOWNLOAD http://storage.exoplatform.org/public/java/jdk/openjdk/${JDK_VERSION}/openjdk-${JDK_VERSION}_linux-x64_bin.tar.gz


# Install OpenJDK Java 21 SDK
ENV JVM_DIR /usr/lib/jvm
RUN mkdir -p "${JVM_DIR}"

RUN wget -q --no-cookies --no-check-certificate \
  -O "${DOWNLOAD_DIR}/openjdk-${JDK_VERSION}-linux-x64.tar.gz" "${JDK_DOWNLOAD}" \
  && cd "${JVM_DIR}" \
  && tar --no-same-owner -xzf "${DOWNLOAD_DIR}/openjdk-${JDK_VERSION}-linux-x64.tar.gz" \
  && rm -f "${DOWNLOAD_DIR}/openjdk-${JDK_VERSION}-linux-x64.tar.gz" \
  && mv "${JVM_DIR}/jdk-${JDK_VERSION}+${TEMURIN_SUFFIX}" "${JVM_DIR}/java-${JDK_VERSION}-openjdk-x64" \
  && ln -s "${JVM_DIR}/java-${JDK_VERSION}-openjdk-x64" "${JVM_DIR}/java-${JDK_MAJOR_VERSION}-openjdk-x64"

ADD java-x64.jinfo ${JVM_DIR}/.java-x64.jinfo
RUN cat "${JVM_DIR}/.java-x64.jinfo" | grep -E '^(jre|jdk|hl)' | awk '{print "/usr/bin/" $2 " " $2 " " $3 " 30 \n"}' | xargs -t -n4 sudo update-alternatives --install
ENV JAVA_HOME ${JVM_DIR}/java-${JDK_MAJOR_VERSION}-openjdk-x64