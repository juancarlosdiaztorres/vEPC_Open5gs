FROM ubuntu:18.04

#Execute upgrade if needed
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -yq dist-upgrade

# Install dependencies
RUN apt-get --no-install-recommends -qqy install python3-pip python3-setuptools ninja-build build-essential flex bison git libsctp-dev libgnutls28-dev libgcrypt-dev libssl-dev libidn11-dev libmongoc-dev libbson-dev libyaml-dev iproute2 iptables iputils-ping tcpdump
RUN pip3 install --user meson

# Download 1.2.2 version (last 4G stable release, 1.2.3 is now 4,5G with some 5G GWs)
RUN git clone -b v1.2.2 --recursive https://github.com/open5gs/open5gs
# Compile Open5GS 1.2.2 version
RUN cd open5gs && ~/.local/bin/meson build --prefix=/ && ninja -C build && cd build && ninja install

RUN apt-get -y install curl gnupg

ENV TZ=Europe/Madrid

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get --no-install-recommends -qy install tshark

ENV MONGODB_STARTUP_TIME 15
WORKDIR /
              
