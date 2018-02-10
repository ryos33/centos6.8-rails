#!/bin/sh

mkdir -p /home/vagrant/.ssh
cp -p /vagrant/.vagrant/machines/default/virtualbox/private_key /home/vagrant/.ssh/id_rsa
chmod 400 /home/vagrant/.ssh/id_rsa
chown vagrant. /home/vagrant/.ssh/id_rsa
