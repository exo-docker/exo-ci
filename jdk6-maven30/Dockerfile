FROM       exoplatform/base-jdk:jdk6
MAINTAINER GREAU Maxime <mgreau+docker@exoplatform.com>

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# eXo CI User
ENV EXO_CI_USER ciagent
ENV EXO_GROUP ciagent

# Required directories for ciagent
ENV EXO_CI_BASE            /opt/ciagent
ENV EXO_CI_TOOLS_DIR       ${EXO_CI_BASE}/ci-tools
ENV EXO_CI_DATA_DIR        ${EXO_CI_BASE}/workspace
ENV EXO_CI_LOG_DIR         ${EXO_CI_BASE}/logs
ENV EXO_CI_TMP_DIR         ${EXO_CI_BASE}/tmp

# CI Tools version
ENV MAVEN_VERSION 3.0.5

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN useradd --create-home --user-group --shell /bin/bash ${EXO_CI_USER}
# giving all rights to eXo CI user
RUN echo "ciagent  ALL = NOPASSWD: ALL" > /etc/sudoers.d/ciagent && chmod 440 /etc/sudoers.d/ciagent

# Create needed directories
RUN mkdir -p ${EXO_CI_TOOLS_DIR} && chown ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_TOOLS_DIR}
RUN mkdir -p ${EXO_CI_BASE}/.m2/repository && chown -R ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_BASE}
RUN mkdir -p ${EXO_CI_DATA_DIR}  && chown -R ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_DATA_DIR}
RUN mkdir -p ${EXO_CI_TMP_DIR}   && chown ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_TMP_DIR}
RUN mkdir -p ${EXO_CI_LOG_DIR}   && chown ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_LOG_DIR}

# Install Maven
RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION ${EXO_CI_TOOLS_DIR}/maven-$MAVEN_VERSION

# Workaround to be able to execute others command than "mvn" as entrypoint
COPY docker-entrypoint.sh /
RUN  chown ${EXO_CI_USER}:${EXO_GROUP} /*.sh \
     && chmod u+x /*.sh

USER ${EXO_CI_USER}
# Custom configuration for Maven
ENV M2_HOME=${EXO_CI_TOOLS_DIR}/maven-$MAVEN_VERSION
ENV MAVEN_OPTS="-Dmaven.repo.local=${EXO_CI_BASE}/.m2/repository -XX:+UseConcMarkSweepGC -Xms1G -Xmx2G -XX:MaxPermSize=512M -Dcom.sun.media.jai.disableMediaLib=true -Djava.io.tmpdir=${EXO_CI_TMP_DIR} -Dmaven.artifact.threads=10 -Djava.awt.headless=true"
ENV PATH=$JAVA_HOME/bin:$M2_HOME/bin:$PATH

VOLUME ["/opt/ciagent/log", "/opt/ciagent/workspace", "/opt/ciagent/.m2"]

WORKDIR ${EXO_CI_DATA_DIR}

# Workaround to be able to execute others command than "mvn" as entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["mvn", "--help"]
