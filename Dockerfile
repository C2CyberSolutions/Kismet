FROM ubuntu:18.04

WORKDIR /usr/src/kismet

ADD kismet* /etc/kismet/

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get update && apt-get install wget gnupg2 -y && \
  wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key | apt-key add - && \
  echo 'deb https://www.kismetwireless.net/repos/apt/release/bionic bionic main' | tee /etc/apt/sources.list.d/kismet.list && \
  apt-get update && \
  apt-get install kismet2018 -yq

CMD ["kismet"]

EXPOSE 2501
