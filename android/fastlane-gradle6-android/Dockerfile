FROM exoplatform/ci:jdk8-gradle6-android

LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

USER root
# Use default location of keystore
ENV GOOGLE_PLAY_EXO_KEYSTORE_PROPS /srv/ciagent/workspace/keystore.properties

WORKDIR /src

# Install all prerequisites
RUN apt-get update
RUN apt-get install -y ruby ruby-dev gem build-essential less vim curl libcurl3-dev libcurl3-dev imagemagick librsvg2-bin
RUN apt-add-repository ppa:brightbox/ruby-ng -y
RUN apt-get update
# Install ruby 2.5
RUN apt-get install ruby2.5 ruby2.5-dev -y
# Install bundler
RUN gem install bundler
# Install fastlane
RUN gem install fastlane -NV
# Set fastlane as the entrypoint
ENTRYPOINT [ "/usr/local/bin/fastlane"]
