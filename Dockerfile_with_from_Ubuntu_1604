FROM ubuntu:16.04
LABEL MAINTAINER Mathias Stadler <stadler-mathias@web.de>
LABEL CREDIT Benjamin Henrion <zoobab@gmail.com>


ADD https://releases.hashicorp.com/vagrant/1.9.6/vagrant_1.9.6_x86_64.deb /tmp
ADD https://www.virtualbox.org/download/oracle_vbox_2016.asc  /tmp
WORKDIR /root/vagrant-openwrt

RUN echo "deb http://archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list && \
echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" >> /etc/apt/sources.list.d/virtualbox.list  && \
apt-key add /tmp/oracle_vbox_2016.asc && \
apt-get update && \
apt-get remove virtualbox virtualbox-5.0 virtualbox-4.* && \
apt-get install -yy  virtualbox-5.1  openssh-client && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /tmp/oracle_vbox_2016.asc && \
dpkg -i /tmp/vagrant_1.9.6_x86_64.deb && \
rm  /tmp/vagrant_1.9.6_x86_64.deb && \
mkdir -pv /root/vagrant-openwrt && \
vagrant init living42/openwrt-15.05-x86 && \
vagrant box add living42/openwrt-15.05-x86 

# using OpenWRT image, only 7MB in size
COPY vagrant-openwrt/Vagrantfile /root/vagrant-openwrt/Vagrantfile