#!/bin/sh

rails_ver=${1:-5.1.4}
install_user=${2:-vagrant}

if [ $install_user = "ALL" ]; then
  owner="root"
else
  owner=$install_user
fi

sudo -i -u $owner  gem install --no-ri --no-rdoc rails -v $rails_ver
sudo -i -u $owner  rbenv rehash
