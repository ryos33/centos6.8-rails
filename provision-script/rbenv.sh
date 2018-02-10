#!/bin/sh

ruby_ver=${1:-2.3.0}
rbenv_dir=${2:-/opt/rbenv}

yum -y install git-all gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel

git clone https://github.com/sstephenson/rbenv.git $rbenv_dir

cat << EOS > /etc/profile.d/rbenv.sh
export RBENV_ROOT="${rbenv_dir}"
export PATH="\${RBENV_ROOT}/bin:\${PATH}"
eval "\$(rbenv init -)"
EOS

source /etc/profile

rbenv --version

git clone https://github.com/sstephenson/ruby-build.git /opt/rbenv/plugins/ruby-build
rbenv install $ruby_ver
rbenv global $ruby_ver
rbenv rehash
rbenv versions

ruby -v

gem update --system --no-ri --no-rdoc
rbenv rehash
