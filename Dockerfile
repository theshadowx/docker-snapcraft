FROM ubuntu:xenial
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt update && apt dist-upgrade -y && apt install -y snapcraft && apt clean

# enable multiverse as snapcraft cleanbuild does
RUN sed -i 's/ universe/ universe multiverse/' /etc/apt/sources.list
RUN add-apt-repository ppa:beineri/opt-qt58-xenial -y &&\
    apt update &&\
    apt upgrade -y &&\
    apt install -y \
        software-properties-common \
        qt58-meta-full  \
        build-essential \
        libxcb1-dev     \
        libx11-dev      \
        libgl1-mesa-dev

RUN echo "source /opt/qt58/bin/qt58-env.sh" >> ~/.bashrc
