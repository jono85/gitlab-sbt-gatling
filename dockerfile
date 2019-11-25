FROM ubuntu:latest

RUN apt update && apt install curl jq bc python3-pip default-jdk -y
RUN pip3 install awscli
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add
RUN apt update && apt install sbt -y

RUN sbt gatling:test
RUN sbt gatling:test || echo "sbt prep finished"

ENTRYPOINT /bin/bash
