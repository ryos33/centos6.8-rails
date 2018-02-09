#!/bin/sh

service iptables stop
service ip6tables stop
chkconfig iptables off
chkconfig ip6tables off

cat << EOS > /etc/sysconfig/clock
ZONE="Asia/Tokyo"
UTC="false"
EOS

source /etc/sysconfig/clock
/bin/cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

cat << EOS > /etc/sysconfig/i18n
LANG="ja_JP.utf8"
SYSFONT="latarcyrheb-sun16"
EOS
