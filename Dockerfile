FROM ubuntu:xenial
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt update && apt dist-upgrade -y && apt install -y snapcraft && apt clean

# enable multiverse as snapcraft cleanbuild does
RUN sed -i 's/ universe/ universe multiverse/' /etc/apt/sources.list
RUN apt update &&\
    apt upgrade -y &&\
    apt install software-properties-common -y &&\
    add-apt-repository ppa:beineri/opt-qt58-xenial -y &&\
    apt update &&\
    apt install qt58-meta-minimal -y &&\
    apt install build-essential -y &&\
    apt install libxcb1-dev -y &&\
    apt install libx11-dev -y &&\
    apt install  libgl1-mesa-dev -y

RUN source /opt/qt58/bin/qt58-env.sh
