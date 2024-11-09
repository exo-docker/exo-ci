FROM exoplatform/ci:jdk17-gradle8
LABEL MAINTAINER "eXo Platform <docker@exoplatform.com>"

USER root

# Install dependencies
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -yq libc6:i386 libstdc++6:i386 zlib1g:i386 libncurses5:i386 --no-install-recommends && \
    apt-get clean

# Download and untar SDK
ENV ANDROID_SDK_URL=https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
RUN curl -L "${ANDROID_SDK_URL}" -o /tmp/commandlinetools-linux.zip \
    && unzip /tmp/commandlinetools-linux.zip -d /usr/local/android-sdk-linux \
    && rm -f /tmp/commandlinetools-linux.zip

# Required for sdkmanager
RUN mv /usr/local/android-sdk-linux/cmdline-tools /usr/local/android-sdk-linux/cmdline \
    && mkdir -p /usr/local/android-sdk-linux/cmdline-tools \
    && mv /usr/local/android-sdk-linux/cmdline /usr/local/android-sdk-linux/cmdline-tools/latest

# Install Android SDK components
RUN yes | /usr/local/android-sdk-linux/cmdline-tools/latest/bin/sdkmanager --update --channel=0
RUN yes | /usr/local/android-sdk-linux/cmdline-tools/latest/bin/sdkmanager --list --channel=0
RUN yes | /usr/local/android-sdk-linux/cmdline-tools/latest/bin/sdkmanager \
    "platform-tools" \
    "build-tools;26.0.2" \
    "build-tools;26.0.3" \
    "build-tools;27.0.3" \
    "build-tools;28.0.3" \
    "build-tools;29.0.3" \
    "build-tools;33.0.2" \
    --channel=0
RUN yes | /usr/local/android-sdk-linux/cmdline-tools/latest/bin/sdkmanager \
    "platforms;android-23" \ 
    "platforms;android-24" \
    "platforms;android-25" \
    "platforms;android-26" \
    "platforms;android-27" \
    "platforms;android-28" \
    "platforms;android-29" \
    "platforms;android-30" \
    "platforms;android-31" \
    "platforms;android-32" \
    "platforms;android-33" \
    "platforms;android-34" \
    --channel=0
RUN yes | /usr/local/android-sdk-linux/cmdline-tools/latest/bin/sdkmanager "extras;android;m2repository" "extras;google;m2repository" --channel=0

RUN yes | /usr/local/android-sdk-linux/cmdline-tools/latest/bin/sdkmanager --licenses

USER ${EXO_CI_USER}

# Setup environment
ENV ANDROID_HOME=/usr/local/android-sdk-linux
ENV ANDROID_SDK=/usr/local/android-sdk-linux
ENV PATH=${ANDROID_HOME}/tools:$ANDROID_HOME/platform-tools:$PATH

# Create needed directories for Gradle & git
RUN mkdir -p ${HOME}/.android
