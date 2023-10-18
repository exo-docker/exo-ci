# Dockerizing a base images with:
#
#   - Ubuntu 22.04
#   - Base eXo CI Configuration
#
# build :   docker build -t exoplatform/ci:base-ubuntu22 .
#

FROM  phusion/baseimage:jammy-1.0.1
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

ENV TERM xterm

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Cleanup the base image from useless things
RUN rm -rf /etc/service/sshd/

# Install some useful or needed tools
ENV DEBIAN_FRONTEND noninteractive
# --force-confold: do not modify the current configuration file, the new version is installed with a .dpkg-dist suffix. With this option alone, even configuration
#   files that you have not modified are left untouched. You need to combine it with
# --force-confdef to let dpkg overwrite configuration files that you have not modified.
ENV _APT_OPTIONS -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
RUN apt-get -qq update && \
  apt-get -qq -y full-upgrade ${_APT_OPTIONS} && \
  apt-get -qq -y install ${_APT_OPTIONS} \
    wget \
    curl \
    expect \
    htop \
    unzip && \
  add-apt-repository ppa:git-core/ppa && \
  apt-get update && \
  apt-get install git xmlstarlet openssl libssl-dev -y && \
  apt-get -y install \
    make \
    python2.7 -y && \
  apt-get -y install build-essential sudo && \
  apt-get -qq -y autoremove

# Install git lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash

RUN apt-get install git-lfs

RUN apt-get -qq -y clean && \
  rm -rf /var/lib/apt/lists/*
# Install yq + gh (Github CLI)
RUN wget -nv -q -O /usr/bin/yq https://github.com/mikefarah/yq/releases/download/v4.27.5/yq_linux_amd64 && \
  echo "fe08cd1b6c23c8c5bf4f94e0f9d4b5b2 /usr/bin/yq" | md5sum -c - \
  || { \
  echo "ERROR: the [/usr/bin/yq] binary downloaded from a github release was modified while is should not !!"; \
  return 1; \
  } && chmod a+x /usr/bin/yq

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && apt-get -qq update \
  && apt-get -qq -y install gh

# Add some aliases
RUN echo "alias ll='ls -al --color'" > /etc/profile.d/aliases.sh

# Configure htop for root user
RUN mkdir -p /root/.config/htop/ && chmod -R 700 /root/.config/htop/
ADD conf/htoprc.conf /root/.config/htop/htoprc


####
# eXo CI User
###
ARG EXO_CI_USER_UID=13000
ENV EXO_CI_USER ciagent
ENV EXO_GROUP ciagent
ENV HOME /home/${EXO_CI_USER}

# Required directories for ciagent
ENV EXO_CI_BASE       /srv/ciagent
ENV EXO_CI_DATA_DIR   ${EXO_CI_BASE}/workspace
ENV EXO_CI_LOG_DIR    ${EXO_CI_BASE}/logs
ENV EXO_CI_TMP_DIR    ${EXO_CI_BASE}/tmp

# - Create user and group with specific ids
# - giving all rights to eXo CI user
# - Create needed directories
RUN useradd --create-home --user-group -u ${EXO_CI_USER_UID} --shell /bin/bash ${EXO_CI_USER} \
   && echo "ciagent  ALL = NOPASSWD: ALL" > /etc/sudoers.d/ciagent && chmod 440 /etc/sudoers.d/ciagent \
   && mkdir -p ${EXO_CI_DATA_DIR}  \
   && mkdir -p ${EXO_CI_TMP_DIR} \
   && mkdir -p ${EXO_CI_LOG_DIR} \
   && chown -R ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_BASE}