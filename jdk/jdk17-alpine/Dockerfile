# Dockerizing a jdk17 images with:
#
#   - OpenJDK JDK 17
#
# build :   docker build -t exoplatform/ci:jdk17-alpine .
#
FROM exoplatform/ci:base-alpine
LABEL MAINTAINER="eXo Platform <docker@exoplatform.com>"

ENV TERM=xterm

ENV JDK_MAJOR_VERSION=17

# Install OpenJDK Java 17 SDK
RUN wget -P /etc/apk/keys/ https://cdn.azul.com/public_keys/alpine-signing@azul.com-5d5dc44c.rsa.pub 
RUN echo "https://repos.azul.com/zulu/alpine" | tee -a /etc/apk/repositories

RUN apk add --no-cache zulu${JDK_MAJOR_VERSION}-jdk

ENV JAVA_HOME=/usr/lib/jvm/zulu${JDK_MAJOR_VERSION}

# Block the eMudhra (emSign) CAs with compromised private keys (October 2026
# incident, https://emudhra.we-have-a-problem.com/) from the JVM trust path:
# the 8 intermediate CAs in both their eMudhra-issued and Sectigo (AAA
# Certificate Services) cross-signed variants, plus the emSign ECC Root
# CA - G3 root they chain to (removed by Mozilla in NSS 3.131.1). PKIX
# validation rejects any chain containing a fingerprint listed in
# blocked.certs; cacerts and all other roots are left untouched.
COPY emudhra-blocked.certs /tmp/emudhra-blocked.certs
RUN cat /tmp/emudhra-blocked.certs >> ${JAVA_HOME}/lib/security/blocked.certs && \
    rm -f /tmp/emudhra-blocked.certs