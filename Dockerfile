FROM alpine:latest

RUN apk add --no-cache \
        aws-cli \
        curl \
        fish \
        jq \
        sudo \
        wget \
        yq

CMD /usr/bin/fish
