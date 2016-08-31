FROM phusion/baseimage:0.9.18

MAINTAINER  eXo Platform <docker@exoplatform.com>

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

# Create user and group with specific ids
RUN useradd --create-home --user-group -u 13000 --shell /bin/bash ${EXO_CI_USER}
# giving all rights to eXo CI user
RUN echo "ciagent  ALL = NOPASSWD: ALL" > /etc/sudoers.d/ciagent && chmod 440 /etc/sudoers.d/ciagent

# Install puppet tools
RUN apt-get update && apt-get install -y puppet && gem install r10k -v 2.4.3

# Create needed directories
RUN mkdir -p ${EXO_CI_DATA_DIR}  \
   && mkdir -p ${EXO_CI_TMP_DIR} \
   && mkdir -p ${EXO_CI_LOG_DIR} \
   && chown -R ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_BASE}

# Install Git (required for Maven plugins)
RUN  add-apt-repository ppa:git-core/ppa && \
  apt-get update && \
  sudo apt-get install git -y && \
  apt-get -qq -y autoremove && \
  apt-get -qq -y clean && \
  rm -rf /var/lib/apt/lists/*

# Workaround to be able to execute others command than "mvn" as entrypoint
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint
COPY validate_puppet.sh /usr/bin/validate_puppet
RUN  chown ${EXO_CI_USER}:${EXO_GROUP} /usr/bin/docker-entrypoint /usr/bin/validate_puppet \
     && chmod u+x /usr/bin/docker-entrypoint /usr/bin/validate_puppet

USER ${EXO_CI_USER}

# Create needed directories for Maven & git
RUN mkdir -p ${HOME}/.ssh

VOLUME ["/opt/ciagent"]

WORKDIR ${EXO_CI_DATA_DIR}

# Workaround to be able to execute others command than "bash" as entrypoint
ENTRYPOINT ["/usr/bin/docker-entrypoint"]

