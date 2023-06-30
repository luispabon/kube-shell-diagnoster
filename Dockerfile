FROM alpine:latest

RUN apk add --no-cache \
        awscli \
        curl \
        fish \
        sudo \
        wget

CMD /usr/bin/fish
