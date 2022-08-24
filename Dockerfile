FROM ubuntu:latest
RUN mkdir -p ~/software/

RUN apt-get update && \
  apt-get install -y locales && \
  rm -rf /var/lib/apt/lists/* && \
  localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install curl libasound2-data libasound2

# Copy
COPY bin/jdk-11.0.16.1_linux-x64_bin.deb           /root/software/jdk-11.0.16.1_linux-x64_bin.deb
COPY bin/Omada_Controller_v3.2.17_Linux_x64.deb    /root/software/Omada_Controller_v3.2.17_Linux_x64.deb

# Install java
RUN dpkg -i /root/software/jdk-11.0.16.1_linux-x64_bin.deb
RUN apt-get --fix-broken -y install
RUN apt-get -y install jsvc
RUN rm -rf /root/software/jdk-11.0.16.1_linux-x64_bin.deb

# Install Omada Controller
# RUN dpkg -i /root/software/Omada_Controller_v3.2.17_Linux_x64.deb
# RUN rm -rf /root/software/Omada_Controller_v3.2.17_Linux_x64.deb

# Ports
EXPOSE 8088
EXPOSE 8043

ENTRYPOINT [ "/bin/bash" ]
