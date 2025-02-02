FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
curl \
git \
build-essential \
sudo


WORKDIR  /opt/app/

# COPY . /opt/app/dotfiles

ENV DOTPATH=/opt/app/dotfiles
# CMD export DOTPATH=$(pwd) && cat ./etc/lib/vital.sh | bash -s - --zsh --vim

CMD /bin/bash