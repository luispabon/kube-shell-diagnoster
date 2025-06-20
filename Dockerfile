FROM ubuntu:25.04

WORKDIR /build

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        amqp-tools \
        awscli \
        bind9-dnsutils \
        ca-certificates \
        curl \
        fish \
        htop \
        inetutils-ping \
        iputils-tracepath \
        jq \
        kcat \
        less \
        nano \
        openssh-client \
        redis-tools \
        sudo \
        traceroute \
        unzip \
        yq \
        wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

ENV MONGOSH_VERSION=1.10.6

RUN wget https://downloads.mongodb.com/compass/mongodb-mongosh-shared-openssl3_${MONGOSH_VERSION}_amd64.deb -O mongosh.deb \
    && dpkg -i mongosh.deb \
    && apt -fy install \
    && rm mongosh.deb

CMD /usr/bin/fish
