FROM ubuntu:16.04
MAINTAINER Benjamin Henrion <zoobab@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list
RUN echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" >> /etc/apt/sources.list.d/virtualbox.list


RUN apt-get update && apt-get -y -q install --no-install-recommends openssh-client && \
apt-get -y -q remove openssh-client
apt-get remove virtualbox virtualbox-5.0 virtualbox-4.*

#XXXX

RUN wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc 
RUN apt-key add oracle_vbox_2016.asc
RUN apt-get update
RUN apt install -yy virtualbox-5.1
RUN wget https://releases.hashicorp.com/vagrant/1.9.6/vagrant_1.9.6_x86_64.deb
RUN dpkg -i vagrant_1.9.6_x86_64.deb
RUN rm  vagrant_1.9.6_x86_64.deb
RUN apt-get install -yy vim
# using OpenWRT image, only 7MB in size
RUN mkdir -pv /root/vagrant-openwrt
WORKDIR /root/vagrant-openwrt
RUN vagrant init living42/openwrt-15.05-x86
RUN vagrant box add living42/openwrt-15.05-x86
COPY vagrant-openwrt/Vagrantfile /root/vagrant-openwrt/Vagrantfile
