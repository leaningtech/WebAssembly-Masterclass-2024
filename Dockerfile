FROM docker.io/ubuntu:jammy

RUN apt-get -y update
RUN apt-get -y install software-properties-common wabt wget
RUN add-apt-repository ppa:leaningtech-dev/cheerp-nightly-ppa
RUN apt-get -y update
RUN apt-get -y install cheerp-core

RUN wget https://github.com/TheWaWaR/simple-http-server/releases/download/v0.6.9/x86_64-unknown-linux-musl-simple-http-server -O /usr/local/bin/simple-http-server
RUN chmod a+x /usr/local/bin/simple-http-server

RUN mkdir /project
RUN chmod a+rwx /project

ENV PATH="/opt/cheerp/bin:${PATH}"
WORKDIR /project

