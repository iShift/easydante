FROM ubuntu:16.04

RUN apt-get update && apt-get -y install wget openssl libwrap0
RUN wget http://ppa.launchpad.net/dajhorn/dante/ubuntu/pool/main/d/dante/dante-server_1.4.1-1_amd64.deb
RUN dpkg -i dante-server_1.4.1-1_amd64.deb
COPY danted.conf /etc/danted.conf
COPY bootstrap.sh /root/bootstrap.sh
CMD ["sh", "/root/bootstrap.sh"]
