#!/bin/sh

ruby_ver=${1:-2.3.0}
install_user=${2:-vagrant}
rbenv_dir=${3:-/opt/rbenv}

yum -y install gcc gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel git-all epel-release vim wget sqlite-devel tcl libffi-devel

umask 0022

if [ $install_user = "ALL" ]; then
  owner="root"
  rbenv_profile_root=$rbenv_dir
  rbenv_profile=/etc/profile.d/rbenv_profile.sh
else
  owner=$install_user
  rbenv_profile_root='$HOME/.rbenv'
#  rbenv_profile="/home/${install_user}/.bash_profile"
  rbenv_profile=/etc/profile.d/rbenv_profile.sh

  home_dir=`sudo -i -u $owner pwd`
  rbenv_dir="${home_dir}/.rbenv"
fi


cat << EOS > $rbenv_profile
if [ -d "${rbenv_profile_root}" ]; then
  export RBENV_ROOT="${rbenv_profile_root}"
  export PATH="\${RBENV_ROOT}/bin:\${PATH}"
  eval "\$(rbenv init -)"
fi
EOS


sudo -i -u $owner  git clone https://github.com/sstephenson/rbenv.git $rbenv_dir
sudo -i -u $owner  rbenv --version

sudo -i -u $owner  git clone https://github.com/sstephenson/ruby-build.git ${rbenv_dir}/plugins/ruby-build
sudo -i -u $owner  rbenv install $ruby_ver
sudo -i -u $owner  rbenv global $ruby_ver
sudo -i -u $owner  rbenv rehash
sudo -i -u $owner  rbenv versions

sudo -i -u $owner  ruby -v

sudo -i -u $owner  gem install bundler --no-ri --no-rdoc
sudo -i -u $owner  gem update --system --no-ri --no-rdoc
sudo -i -u $owner  rbenv rehash
