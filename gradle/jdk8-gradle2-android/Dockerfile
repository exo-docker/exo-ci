FROM exoplatform/ci:jdk8-gradle2
LABEL MAINTAINER="eXo Platform <docker@exoplatform.com>"

USER root

# Install dependencies
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -yq libc6:i386 libstdc++6:i386 zlib1g:i386 libncurses5:i386 --no-install-recommends && \
    apt-get clean

# Download and untar SDK
ENV ANDROID_SDK_URL=http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
RUN curl -L "${ANDROID_SDK_URL}" | tar --no-same-owner -xz -C /usr/local

# Install Android SDK components

# License Id: android-sdk-license-ed0d0a5b
ENV ANDROID_COMPONENTS=platform-tools,build-tools-23.0.3,build-tools-24.0.0,build-tools-24.0.2,android-23,android-24
# License Id: android-sdk-license-5be876d5
ENV GOOGLE_COMPONENTS=extra-android-m2repository,extra-google-m2repository

RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --all --filter "${ANDROID_COMPONENTS}" ; \
    echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --all --filter "${GOOGLE_COMPONENTS}"

USER ${EXO_CI_USER}

# Setup environment
ENV ANDROID_HOME=/usr/local/android-sdk-linux
ENV ANDROID_SDK=/usr/local/android-sdk-linux
ENV PATH=${ANDROID_HOME}/tools:$ANDROID_HOME/platform-tools:$PATH

# Create needed directories for Gradle & git
RUN mkdir -p ${HOME}/.android
