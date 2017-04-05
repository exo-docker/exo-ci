# Dockerizing a base images with:
#
#   - Ubuntu 14.04
#   - Base eXo CI Configuration
#

FROM  phusion/baseimage:0.9.18
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
  apt-get -qq -y upgrade ${_APT_OPTIONS} && \
  apt-get -qq -y install ${_APT_OPTIONS} \
    wget \
    curl \
    expect \
    htop \
    unzip && \
  add-apt-repository ppa:git-core/ppa && \
  apt-get update && \
  apt-get install git xmlstarlet -y && \
  apt-get -qq -y autoremove && \
  apt-get -qq -y clean && \
  rm -rf /var/lib/apt/lists/*

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