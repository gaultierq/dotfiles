FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
curl \
git \
build-essential \
sudo


WORKDIR  /opt/app

ENV DOTPATH=/opt/app/dotfiles

RUN cat $DOTPATH/etc/lib/vital.sh | bash -s - --zsh --vim

CMD /bin/bash