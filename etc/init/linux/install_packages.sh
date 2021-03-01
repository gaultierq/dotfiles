#!/bin/bash -e


echo "Installing broot"
echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list
wget -qO - https://azlux.fr/repo.gpg.key | sudo apt-key add -

sudo apt-get update &&

sudo apt-get -y --force-yes install broot

