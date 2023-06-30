FROM alpine:latest

RUN apk add --no-cache \
        aws-cli \
        curl \
        fish \
        sudo \
        wget

CMD /usr/bin/fish
