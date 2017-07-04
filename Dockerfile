FROM ubuntu:16.04
MAINTAINER Benjamin Henrion <zoobab@gmail.com>
MAINTAINER Mathias Stadler <stadler-mathias@web.de>


RUN echo "deb http://archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list
# wget replaced with ADD

RUN apt-get update && \
apt-get install -yy --no-install-recommends vim openssh-client && \\
apt-get remove virtualbox virtualbox-5.0 virtualbox-4.*


ADD https://www.virtualbox.org/download/oracle_vbox_2016.asc  .

RUN echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" >> /etc/apt/sources.list.d/virtualbox.list  && \
apt-key add oracle_vbox_2016.asc && \
apt-get update && \
apt-get install -yy virtualbox-5.1

ADD https://releases.hashicorp.com/vagrant/1.9.6/vagrant_1.9.6_x86_64.deb .
RUN dpkg -i vagrant_1.9.6_x86_64.deb
RUN rm  vagrant_1.9.6_x86_64.deb

# using OpenWRT image, only 7MB in size
RUN mkdir -pv /root/vagrant-openwrt
WORKDIR /root/vagrant-openwrt
RUN vagrant init living42/openwrt-15.05-x86
RUN vagrant box add living42/openwrt-15.05-x86
COPY vagrant-openwrt/Vagrantfile /root/vagrant-openwrt/Vagrantfile