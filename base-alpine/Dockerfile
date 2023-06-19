# Dockerizing a base images with:
#
#   - alpine 3.18
#   - Base eXo CI Configuration
#
# build :   docker build -t exoplatform/ci:base-alpine .
#

FROM  alpine:3.18
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

# Install some useful or needed tools
RUN apk update && \
  apk upgrade && \
  apk add --no-cache xmlstarlet jq bash wget curl htop unzip git git-lfs make python3 sudo xterm github-cli expect busybox sed

ENV TERM xterm

# Set the locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN fc-cache -f

# Install yq
RUN wget -nv -q -O /usr/bin/yq https://github.com/mikefarah/yq/releases/download/v4.27.5/yq_linux_amd64 && \
  echo "fe08cd1b6c23c8c5bf4f94e0f9d4b5b2 /usr/bin/yq" | md5sum -c - \
  || { \
  echo "ERROR: the [/usr/bin/yq] binary downloaded from a github release was modified while is should not !!"; \
  return 1; \
  } && chmod a+x /usr/bin/yq

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
RUN addgroup -g ${EXO_CI_USER_UID} ${EXO_CI_USER}
RUN adduser -u ${EXO_CI_USER_UID} -G ${EXO_CI_USER} -s /bin/bash --disabled-password ${EXO_CI_USER} \
   && echo "ciagent  ALL = NOPASSWD: ALL" > /etc/sudoers.d/ciagent && chmod 440 /etc/sudoers.d/ciagent \
   && mkdir -p ${EXO_CI_DATA_DIR}  \
   && mkdir -p ${EXO_CI_TMP_DIR} \
   && mkdir -p ${EXO_CI_LOG_DIR} \
   && chown -R ${EXO_CI_USER}:${EXO_GROUP} ${EXO_CI_BASE}