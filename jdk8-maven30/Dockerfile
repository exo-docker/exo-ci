FROM       exoplatform/base-jdk:jdk8
MAINTAINER GREAU Maxime <mgreau+docker@exoplatform.com>

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# eXo CI User
ENV EXO_CI_USER ciagent
ENV EXO_GROUP ciagent
ENV HOME /home/${EXO_CI_USER}

# Required directories for ciagent
ENV EXO_CI_BASE       /opt/ciagent
ENV EXO_CI_DATA_DIR   ${EXO_CI_BASE}/workspace
ENV EXO_CI_LOG_DIR    ${EXO_CI_BASE}/logs
ENV EXO_CI_TMP_DIR    ${EXO_CI_BASE}/tmp

# CI Tools version
ENV MAVEN_VERSION 3.0.5

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN useradd --create-home --user-group --shell /bin/bash ${EXO_CI_USER}
# giving all rights to eXo CI user
RUN echo "ciagent  ALL = NOPASSWD: ALL" > /etc/sudoers.d/ciagent && chmod 440 /etc/sudoers.d/ciagent

# Create needed directories
RUN mkdir -p ${EXO_CI_DATA_DIR}  && chown -R ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_DATA_DIR}
RUN mkdir -p ${EXO_CI_TMP_DIR}   && chown ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_TMP_DIR}
RUN mkdir -p ${EXO_CI_LOG_DIR}   && chown ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_LOG_DIR}

# Install Git (required for Maven plugins)
RUN  add-apt-repository ppa:git-core/ppa && \
  apt-get update && \
  sudo apt-get install git -y && \
  apt-get -qq -y autoremove && \
  apt-get -qq -y clean && \
  rm -rf /var/lib/apt/lists/*

# Install Maven
RUN mkdir -p /usr/share/maven \
    && curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
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
RUN mkdir -p ${HOME}/.m2 \
    && mkdir -p ${HOME}/.ssh \
    && mkdir -p ${HOME}/.gnupg

VOLUME ["/opt/ciagent", "/usr/share/maven"]

WORKDIR ${EXO_CI_DATA_DIR}

# Workaround to be able to execute others command than "mvn" as entrypoint
ENTRYPOINT ["/usr/bin/docker-entrypoint"]

CMD ["mvn", "--help"]
