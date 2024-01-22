# Dockerizing a jdk6 images with:
#
#   - Oracle JDK 6
#
# build :   docker build -t exoplatform/ci:jdk6 .
#
FROM exoplatform/ci:base
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

ENV TERM xterm

ENV JDK_VERSION_MAJOR 6
ENV JDK_VERSION_UPDATE 45
ENV JDK_VERSION_BUILD b06

ENV JDK_VERSION ${JDK_VERSION_MAJOR}u${JDK_VERSION_UPDATE}
ENV JDK_VERSION_DOT 1.${JDK_VERSION_MAJOR}.0
ENV JDK_VERSION_DOT_UPDATE ${JDK_VERSION_DOT}_${JDK_VERSION_UPDATE}
ENV JDK_DOWNLOAD http://storage.exoplatform.org/public/java/jdk/sun/${JDK_VERSION}-${JDK_VERSION_BUILD}/jdk-${JDK_VERSION}-linux-x64.bin

# Install Oracle Java 6 SDK
ENV JVM_DIR /usr/lib/jvm
RUN mkdir -p "${JVM_DIR}"

RUN wget -q --no-cookies --no-check-certificate \
  -O "${DOWNLOAD_DIR}/jdk-${JDK_VERSION}-linux-x64.bin" "${JDK_DOWNLOAD}" && \
  cd "${JVM_DIR}" && \
  chmod +x "${DOWNLOAD_DIR}/jdk-${JDK_VERSION}-linux-x64.bin" && \
  cd "${JVM_DIR}" && \
  "${DOWNLOAD_DIR}/jdk-${JDK_VERSION}-linux-x64.bin" && \
  rm -f "${DOWNLOAD_DIR}/jdk-${JDK_VERSION}-linux-x64.bin" && \
  mv "${JVM_DIR}/jdk1.6.0_45" "${JVM_DIR}/java-${JDK_VERSION_DOT_UPDATE}-oracle-x64" && \
  ln -s "${JVM_DIR}/java-${JDK_VERSION_DOT_UPDATE}-oracle-x64" "${JVM_DIR}/java-${JDK_VERSION_DOT}-oracle-x64"

ADD java-${JDK_VERSION_DOT}-oracle-x64.jinfo ${JVM_DIR}/.java-${JDK_VERSION_DOT}-oracle-x64.jinfo
RUN cat "${JVM_DIR}/.java-${JDK_VERSION_DOT}-oracle-x64.jinfo" | grep -E '^(jre|jdk|hl)' | awk '{print "/usr/bin/" $2 " " $2 " " $3 " 30 \n"}' | xargs -t -n4 sudo update-alternatives --install
ENV JAVA_HOME ${JVM_DIR}/java-${JDK_VERSION_DOT}-oracle-x64
RUN keytool -import -trustcacerts -alias repository.exoplatform.org -storepass changeit -noprompt -file /etc/ssl/certs/repository.exoplatform.org -keystore $JAVA_HOME/jre/lib/security/cacerts