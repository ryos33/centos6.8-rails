#!/bin/sh

yum -y install git-all gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel kernel-devel

git clone https://github.com/sstephenson/rbenv.git /opt/rbenv
echo 'export RBENV_ROOT="/opt/rbenv"' >> /etc/profile
echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> /etc/profile
echo 'eval "$(rbenv init -)"' >> /etc/profile
source /etc/profile

rbenv --version

git clone https://github.com/sstephenson/ruby-build.git /opt/rbenv/plugins/ruby-build
rbenv install 2.3.0
rbenv global 2.3.1
rbenv rehash
rbenv versions

ruby -v

exec $SHELL

gem update --system
gem install --no-ri --no-rdoc rails
gem install bundler
rbenv rehash
