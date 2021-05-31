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
ENV JDK_VERSION_UPDATE 2

ENV JDK_VERSION ${JDK_VERSION_MAJOR}.0.${JDK_VERSION_UPDATE}
ENV JDK_DOWNLOAD http://storage.exoplatform.org/public/java/jdk/openjdk/${JDK_VERSION}/openjdk-${JDK_VERSION}_linux-x64_bin.tar.gz

# Install OpenJDK Java 11 SDK
ENV JVM_DIR /usr/lib/jvm
RUN mkdir -p "${JVM_DIR}"

RUN wget -q --no-cookies --no-check-certificate \
  -O "${DOWNLOAD_DIR}/jdk-${JDK_VERSION}-linux-x64.tar.gz" "${JDK_DOWNLOAD}" && \
  cd "${JVM_DIR}" && \
  tar -xzf "${DOWNLOAD_DIR}/jdk-${JDK_VERSION}-linux-x64.tar.gz" && \
  rm -f "${DOWNLOAD_DIR}/jdk-${JDK_VERSION}-linux-x64.tar.gz" && \
  mv "${JVM_DIR}/jdk-${JDK_VERSION}" "${JVM_DIR}/java-${JDK_VERSION}-openjdk-x64" && \
  ln -s "${JVM_DIR}/java-${JDK_VERSION}-openjdk-x64" "${JVM_DIR}/java-${JDK_VERSION}-openjdk-x64"
ADD java-${JDK_VERSION}-openjdk-x64.jinfo ${JVM_DIR}/.java-${JDK_VERSION}-openjdk-x64.jinfo
RUN cat "${JVM_DIR}/.java-${JDK_VERSION}-openjdk-x64.jinfo" | grep -E '^(jre|jdk|hl)' | awk '{print "/usr/bin/" $2 " " $2 " " $3 " 30 \n"}' | xargs -t -n4 sudo update-alternatives --install
ENV JAVA_HOME ${JVM_DIR}/java-${JDK_VERSION}-openjdk-x64