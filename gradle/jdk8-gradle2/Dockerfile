FROM exoplatform/ci:jdk8
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

# CI Tools version
ENV GRADLE_VERSION=2.14.1

# Download and extract gradle
RUN wget --no-check-certificate --no-cookies https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}-bin.zip -d /usr/share/ \
    && ln -s /usr/share/gradle-${GRADLE_VERSION}/bin/gradle /usr/bin/gradle \
    && rm -f gradle-${GRADLE_VERSION}-bin.zip

# Workaround to be able to execute others command than "gradle" as entrypoint
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint
RUN  chown ${EXO_CI_USER}:${EXO_GROUP} /usr/bin/docker-entrypoint \
     && chmod u+x /usr/bin/docker-entrypoint

USER ${EXO_CI_USER}

# Custom configuration for Gradle
ENV GRADLE_HOME=/usr/share/gradle
ENV PATH=$JAVA_HOME/bin:$GRADLE_HOME/bin:$PATH

# Create needed directories for Gradle & git
RUN mkdir -p ${HOME}/.gradle \
    && mkdir -p ${HOME}/.m2/repository \
    && mkdir -p ${HOME}/.ssh \
    && mkdir -p ${HOME}/.gnupg

WORKDIR ${EXO_CI_DATA_DIR}

# Workaround to be able to execute others command than "gradle" as entrypoint
ENTRYPOINT ["/usr/bin/docker-entrypoint"]

CMD ["gradle", "--help"]
