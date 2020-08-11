FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
curl \
git \
build-essential \
sudo


WORKDIR  /opt/app

COPY ./etc/lib/vital.sh /opt/app/vital.sh
COPY entrypoint.sh /opt/app/entrypoint.sh

ENTRYPOINT ./entrypoint.sh