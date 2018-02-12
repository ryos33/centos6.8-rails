#!/bin/sh

node_ver=${1:-7.10.1}

curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
yum -y install nodejs

npm install -g n
n $node_ver

npm update -g npm
npm update -g
npm outdated -g

su - -c 'node -v'
su - -c 'npm -v'
