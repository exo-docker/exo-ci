# Dockerizing a jdk8-maven35 images with:
#
#   - OpenJDK JDK 8
#   - Maven 3.5
#
# build :   docker build -t exoplatform/ci:jdk8-maven35 .
#
FROM exoplatform/ci:jdk8
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

# CI Tools version
ENV MAVEN_VERSION=3.5.4
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

# Custom configuration for Maven
ENV M2_HOME=/usr/share/maven
ENV MAVEN_OPTS="-Dmaven.repo.local=${HOME}/.m2/repository -XX:+UseConcMarkSweepGC -Xms1G -Xmx2G -XX:MaxMetaspaceSize=1G -Dcom.sun.media.jai.disableMediaLib=true -Djava.io.tmpdir=${EXO_CI_TMP_DIR} -Dmaven.artifact.threads=10 -Djava.awt.headless=true"
ENV PATH=$JAVA_HOME/bin:$M2_HOME/bin:$PATH

# Create needed directories for Maven & git
RUN mkdir -p ${HOME}/.m2/repository \
    && mkdir -p ${HOME}/.ssh \
    && mkdir -p ${HOME}/.gnupg

WORKDIR ${EXO_CI_DATA_DIR}

# Workaround to be able to execute others command than "mvn" as entrypoint
ENTRYPOINT ["/usr/bin/docker-entrypoint"]

CMD ["mvn", "--help"]