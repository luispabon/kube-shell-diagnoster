#FROM ubuntu:22.04
#
#RUN apt-get update \
#    && apt-get install -y --no-install-recommends \
#        curl \
#        wget \
#        bind9-dnsutils \
#        fish \
#    && apt-get clean
#
#RUN chsh root -s /usr/bin/fish

FROM alpine:latest

RUN apk add --no-cache \
        curl \
        fish \
        shadow \
        sudo \
        wget

RUN echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
RUN adduser \
        diagnoster \
        --disabled-password \
        --shell /usr/bin/fish

RUN usermod -a -G wheel diagnoster

CMD /usr/bin/fish

USER diagnoster
# RUN sed -i -e "s/bin\/ash/usr\/bin\/fish/" /etc/passwd

