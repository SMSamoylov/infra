gcloud compute instances create magic-instance\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
--metadata startup-script='#!/bin/bash
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt update
sudo apt install -y mongodb-org
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
'

