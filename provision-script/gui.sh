#!/bin/sh

yum -y groupinstall "Desktop" "Japanese Support" "General Purpose Desktop"

cat << EOS > /etc/inittab
id:5:initdefault:
EOS
