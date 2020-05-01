FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get --no-install-recommends -qqy install python3-pip python3-setuptools ninja-build build-essential flex bison git libsctp-dev libgnutls28-dev libgcrypt-dev libssl-dev libidn11-dev libmongoc-dev libbson-dev libyaml-dev iproute2 iptables
RUN pip3 install --user meson
RUN git clone --recursive https://github.com/open5gs/open5gs
# 1.2.2 version
RUN cd open5gs && git checkout c7856bf3b20f9e0a3023730fd3156563bc8923f7 && ~/.local/bin/meson build --prefix=/ && ninja -C build && cd build && ninja install
RUN apt-get -y install curl gnupg

ENV TZ=Europe/Madrid

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get --no-install-recommends -qy install tshark 

ENV MONGODB_STARTUP_TIME 15
WORKDIR /
