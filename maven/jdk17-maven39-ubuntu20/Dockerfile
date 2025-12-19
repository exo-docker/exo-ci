# Dockerizing a jdk17-maven39-ubuntu20 images with:
#   - ubuntu20
#   - OpenJDK JDK 17
#   - Maven 3.9
#
# build :   docker build -t exoplatform/ci:jdk17-maven39-ubuntu20 .
#
FROM exoplatform/ci:jdk17-ubuntu20
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

# CI Tools version
ENV MAVEN_VERSION=3.9.12
# Install Maven
RUN mkdir -p /usr/share/maven \
    && curl -fsSL https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/$MAVEN_VERSION/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar xzf - -C /usr/share/maven --strip-components=1  \
    && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# Workaround to be able to execute others command than "mvn" as entrypoint
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint
RUN  chown ${EXO_CI_USER}:${EXO_GROUP} /usr/bin/docker-entrypoint \
    && chmod u+x /usr/bin/docker-entrypoint

USER ${EXO_CI_USER}

RUN mkdir -p ${HOME}/.web3j/solc
COPY releases.json ${HOME}/.web3j/solc/
RUN  chown ${EXO_CI_USER}:${EXO_GROUP} ${HOME}/.web3j

# Custom configuration for Maven
ENV M2_HOME=/usr/share/maven
ENV MAVEN_OPTS="-Dmaven.repo.local=${HOME}/.m2/repository -Xms1G -Xmx2G -XX:MaxMetaspaceSize=1G -Dcom.sun.media.jai.disableMediaLib=true -Djava.io.tmpdir=${EXO_CI_TMP_DIR} -Dmaven.artifact.threads=10 -Djava.awt.headless=true --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.net=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens java.base/java.nio.charset=ALL-UNNAMED --add-opens java.base/java.util.regex=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED"
ENV PATH=$JAVA_HOME/bin:$M2_HOME/bin:$PATH

# Create needed directories for Maven & git
RUN mkdir -p ${HOME}/.m2/repository \
    && mkdir -p ${HOME}/.ssh \
    && mkdir -p ${HOME}/.gnupg \
    && chmod 700 ${HOME}/.gnupg 

WORKDIR ${EXO_CI_DATA_DIR}

# Workaround to be able to execute others command than "mvn" as entrypoint
ENTRYPOINT ["/usr/bin/docker-entrypoint"]

CMD ["mvn", "--help"]
