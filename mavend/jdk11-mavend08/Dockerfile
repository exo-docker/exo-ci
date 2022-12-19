# Dockerizing a jdk11-maven38 images with:
#
#   - OpenJDK JDK 11
#   - Mavend 0.8 (mvn 3.8)
#
# build :   docker build -t exoplatform/ci:jdk11-mavend08 .
#
FROM exoplatform/ci:jdk11
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

# CI Tools version
ENV MAVEND_VERSION 0.8.2
# Install Mavend
RUN mkdir -p /usr/share/mavend \
    && curl -fsSL http://archive.apache.org/dist/maven/mvnd/${MAVEND_VERSION}/maven-mvnd-${MAVEND_VERSION}-linux-amd64.tar.gz  \
         | tar xzf - -C /usr/share/mavend --strip-components=1  \
    && ln -s /usr/share/mavend/bin/mvnd /usr/bin/mvnd \
    && ln -s /usr/share/mavend/bin/mvnd /usr/bin/mvn

ADD settings.xml /usr/share/mavend/conf/

# Workaround to be able to execute others command than "mvn" as entrypoint
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint
RUN  chown ${EXO_CI_USER}:${EXO_GROUP} /usr/bin/docker-entrypoint \
     && chmod u+x /usr/bin/docker-entrypoint

USER ${EXO_CI_USER}

# Custom configuration for Mavend
ENV M2_HOME=/usr/share/mavend
ENV MAVEN_OPTS="-Dmaven.repo.local=${HOME}/.m2/repository -XX:+UseConcMarkSweepGC -Xms1G -Xmx2G -XX:MaxMetaspaceSize=1G -Dcom.sun.media.jai.disableMediaLib=true -Djava.io.tmpdir=${EXO_CI_TMP_DIR} -Dmaven.artifact.threads=10 -Djava.awt.headless=true"
ENV PATH=$JAVA_HOME/bin:$M2_HOME/bin:$PATH

# Create needed directories for Mavend & git
RUN mkdir -p ${HOME}/.m2/repository \
    && mkdir -p ${HOME}/.ssh \
    && mkdir -p ${HOME}/.gnupg

WORKDIR ${EXO_CI_DATA_DIR}

# Workaround to be able to execute others command than "mvnd" as entrypoint
ENTRYPOINT ["/usr/bin/docker-entrypoint"]

CMD ["mvnd", "--help"]
