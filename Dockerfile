FROM ghcr.io/graalvm/jdk-community:22

ENV TINI_VERSION=v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

LABEL       author="LinusTebbe" maintainer="linus@tebbe.dev"

LABEL       org.opencontainers.image.source="https://github.com/ThePenguinsGit/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         microdnf install \
                curl \
                lsof \
                ca-certificates \
                openssl \
                git \
                tar \
                sqlite \
                fontconfig \
                tzdata \
                iproute \
                freetype \
				zip \
				unzip

## Setup user and working directory
RUN         useradd -m -d /home/container -s /bin/bash container
USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]