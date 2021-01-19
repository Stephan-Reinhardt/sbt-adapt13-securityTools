FROM adoptopenjdk/openjdk13:alpine-slim

ENV SCALA_VERSION 2.13.4
ENV SBT_VERSION 1.3.13

ENV SBT_OPTS -Dsbt.color=true -Dsbt.supershell=false

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8


ENV PATH /sbt/bin:$PATH

RUN apk add --no-cache \
		ca-certificates \
		openssh-client \
		openjdk8 \
		curl \
		bash \
    nmap

RUN \
  wget -O - https://downloads.typesafe.com/scala/2.13.4/scala-2.13.4.tgz | tar xfz - -C /root/ && \
  echo >> /root/.bashrc && \
  echo "export PATH=~/scala-2.13.4/bin:$PATH" >> /root/.bashrc

# Install SBT
RUN wget https://piccolo.link/sbt-1.3.13.tgz && \
  tar -xzvf sbt-1.3.13.tgz && \
  sbt sbtVersion
