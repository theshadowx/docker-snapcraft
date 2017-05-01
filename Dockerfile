FROM ubuntu:xenial
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt update && apt dist-upgrade -y && apt install -y snapcraft && apt clean

# enable multiverse as snapcraft cleanbuild does
RUN sed -i 's/ universe/ universe multiverse/' /etc/apt/sources.list
RUN apt update &&\
    apt upgrade -y &&\
    apt install -y \
        software-properties-common \
        build-essential \
        libxcb1-dev     \
        libx11-dev      \
        libgl1-mesa-dev

RUN add-apt-repository ppa:beineri/opt-qt551-trusty -y &&\
    apt update &&\
    apt install -y \
        qt55-meta \
        qt55-meta-full

RUN echo "source /opt/qt55/bin/qt55-env.sh" >> ~/.bashrc
