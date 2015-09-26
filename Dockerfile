FROM ubuntu:14.04
MAINTAINER Steven Smith <stevensmith.ome@gmail.com>
RUN apt-get update && apt-get install -y git python-pbs wget
RUN git clone https://github.com/zulip/zulip /srv/zulip
WORKDIR /srv/zulip
RUN python provision.py
EXPOSE 9991
