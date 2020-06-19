FROM ubuntu:20.04

MAINTAINER fabienfoerster
MAINTAINER etiennestrobbe

# Requirements
RUN  add-apt-repository multiverse && apt-get -y update && apt-get -y install lib32gcc1 wget && apt-get install steamcmd

# Open file limit
RUN echo "fs.file-max=100000" >> /etc/sysctl.conf
RUN sysctl -p /etc/sysctl.conf

RUN echo "*               soft    nofile          1000000" >> /etc/security/limits.conf
RUN echo "*               hard    nofile          1000000" >> /etc/security/limits.conf

RUN echo "session required pam_limits.so" >> /etc/pam.d/common-session

#Install game
RUN mkdir -p /server/ark
WORKDIR /server

ENV SERVERPATH "/server/ark"

COPY ark_start.sh ./
RUN chmod +x ark_start.sh


#Expose the port
EXPOSE 34777/udp
EXPOSE 27015/udp



CMD ./ark_start.sh
