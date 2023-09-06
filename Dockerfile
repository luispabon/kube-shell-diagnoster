FROM ubuntu:jammy

WORKDIR /build

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bind9-dnsutils \
        ca-certificates \
        curl \
        fish \
        jq \
        sudo \
        unzip \
        wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN wget "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -O "awscliv2.zip" \
    && unzip awscliv2.zip \
    &&  ./aws/install \
    && rm awscliv2.zip aws -Rf

RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq \
    && chmod +x /usr/bin/yq

ENV MONGOSH_VERSION=1.10.6

RUN wget https://downloads.mongodb.com/compass/mongodb-mongosh-shared-openssl3_${MONGOSH_VERSION}_amd64.deb -O mongosh.deb \
    && dpkg -i mongosh.deb \
    && apt -fy install \
    && rm mongosh.deb

CMD /usr/bin/fish
