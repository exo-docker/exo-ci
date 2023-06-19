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
  apk add --no-cache xmlstarlet jq bash wget curl htop unzip git git-lfs make python3 sudo xterm github-cli expect busybox sed grep yq gnupg openssh openssl msttcorefonts-installer fontconfig

RUN update-ms-fonts

ENV TERM xterm

# Set the locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN fc-cache -f

# Specify primary prompt string for bash navigation
ENV PS1                    "\u@\h:\w$ "

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