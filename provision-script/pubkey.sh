#!/bin/sh

mkdir -p /root/.ssh
mkdir -p /home/vagrant/.ssh
cat /vagrant/key/id.pub >> /root/.ssh/authorized_keys
cat /vagrant/key/id.pub >> /home/vagrant/.ssh/authorized_keys
cat /vagrant/key/id.key > /home/vagrant/.ssh/id_rsa

chmod 644 /root/.ssh/authorized_keys
chmod 644 /home/vagrant/.ssh/authorized_keys
chmod 400 /home/vagrant/.ssh/id_rsa

chown vagrant. /home/vagrant/.ssh
chown vagrant. /home/vagrant/.ssh/authorized_keys
chown vagrant. /home/vagrant/.ssh/id_rsa
