FROM exoplatform/ci:base
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

ENV TERM xterm

ENV JDK_VERSION_MAJOR 7
ENV JDK_VERSION_UPDATE 79
ENV JDK_VERSION_BUILD b14

ENV JDK_VERSION ${JDK_VERSION_MAJOR}u${JDK_VERSION_UPDATE}
ENV JDK_VERSION_DOT 1.${JDK_VERSION_MAJOR}.0
ENV JDK_VERSION_DOT_UPDATE ${JDK_VERSION_DOT}_${JDK_VERSION_UPDATE}
ENV JDK_DOWNLOAD http://download.oracle.com/otn-pub/java/jdk/${JDK_VERSION}-${JDK_VERSION_BUILD}/jdk-${JDK_VERSION}-linux-x64.tar.gz

# Install Oracle Java 7 SDK
ENV JVM_DIR /usr/lib/jvm
RUN mkdir -p "${JVM_DIR}"

RUN wget -q --no-cookies --no-check-certificate \
  --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
  -O "${DOWNLOAD_DIR}/jdk-${JDK_VERSION}-linux-x64.tar.gz" "${JDK_DOWNLOAD}" && \
  cd "${JVM_DIR}" && \
  tar -xzf "${DOWNLOAD_DIR}/jdk-${JDK_VERSION}-linux-x64.tar.gz" && \
  rm -f "${DOWNLOAD_DIR}/jdk-${JDK_VERSION}-linux-x64.tar.gz" && \
  mv "${JVM_DIR}/jdk${JDK_VERSION_DOT_UPDATE}" "${JVM_DIR}/java-${JDK_VERSION_DOT_UPDATE}-oracle-x64" && \
  ln -s "${JVM_DIR}/java-${JDK_VERSION_DOT_UPDATE}-oracle-x64" "${JVM_DIR}/java-${JDK_VERSION_DOT}-oracle-x64"
ADD java-${JDK_VERSION_DOT}-oracle-x64.jinfo ${JVM_DIR}/.java-${JDK_VERSION_DOT}-oracle-x64.jinfo
RUN cat "${JVM_DIR}/.java-${JDK_VERSION_DOT}-oracle-x64.jinfo" | grep -E '^(jre|jdk|hl)' | awk '{print "/usr/bin/" $2 " " $2 " " $3 " 30 \n"}' | xargs -t -n4 sudo update-alternatives --install
ENV JAVA_HOME ${JVM_DIR}/java-${JDK_VERSION_DOT}-oracle-x64