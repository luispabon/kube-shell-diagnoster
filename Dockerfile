FROM alpine:latest

RUN apk add --no-cache \
        curl \
        fish \
        sudo \
        wget

CMD /usr/bin/fish
