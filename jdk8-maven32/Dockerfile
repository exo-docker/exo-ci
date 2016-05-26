FROM       exoplatform/base-jdk:jdk8
MAINTAINER GREAU Maxime <mgreau+docker@exoplatform.com>

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# eXo CI User
ENV EXO_CI_USER exo-ci
ENV EXO_GROUP exo-ci

# Required directories for exo-ci
ENV EXO_CI_TOOLS_DIR       /opt/exo-ci
ENV EXO_CI_DATA_DIR        /srv/exo-ci
ENV EXO_CI_LOG_DIR         /var/log/exo-ci
ENV EXO_CI_TMP_DIR         /tmp/exo-ci-tmp

# CI Tools version
ENV MAVEN_VERSION 3.2.5

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN useradd --create-home --user-group --shell /bin/bash ${EXO_CI_USER}
# giving all rights to eXo CI user
RUN echo "exo-ci  ALL = NOPASSWD: ALL" > /etc/sudoers.d/exo-ci && chmod 440 /etc/sudoers.d/exo-ci

# Create needed directories
RUN mkdir -p ${EXO_CI_TOOLS_DIR} && chown ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_TOOLS_DIR}
RUN mkdir -p ${EXO_CI_DATA_DIR}/.m2/repository && mkdir -p ${EXO_CI_DATA_DIR}/projects && chown -R ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_DATA_DIR}
RUN mkdir -p ${EXO_CI_TMP_DIR}   && chown ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_TMP_DIR}
RUN mkdir -p ${EXO_CI_LOG_DIR}   && chown ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_LOG_DIR}

# Install Maven
RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION ${EXO_CI_TOOLS_DIR}/maven-$MAVEN_VERSION

USER ${EXO_CI_USER}
# Custom configuration for Maven
ENV M2_HOME=${EXO_CI_TOOLS_DIR}/maven-$MAVEN_VERSION
ENV MAVEN_OPTS="-Dmaven.repo.local=/srv/exo-ci/.m2/repository -XX:+UseConcMarkSweepGC -Xms1G -Xmx2G -XX:MaxMetaspaceSize=1G -Dcom.sun.media.jai.disableMediaLib=true -Djava.io.tmpdir=${EXO_CI_TMP_DIR} -Dmaven.artifact.threads=10 -Djava.awt.headless=true"
ENV PATH=$JAVA_HOME/bin:$M2_HOME/bin:$PATH

VOLUME ["/var/log/exo-ci", "/srv/exo-ci"]

WORKDIR ${EXO_CI_DATA_DIR}/projects

ENTRYPOINT ["mvn"]
CMD ["--version"]
