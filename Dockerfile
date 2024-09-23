FROM docker.io/ubuntu:jammy

RUN apt-get -y update
RUN apt-get -y install software-properties-common wabt
RUN add-apt-repository ppa:leaningtech-dev/cheerp-nightly-ppa
RUN apt-get -y update
RUN apt-get -y install cheerp-core

RUN mkdir /project
RUN chmod a+rwx /project

ENV PATH="/opt/cheerp/bin:${PATH}"
WORKDIR /project

