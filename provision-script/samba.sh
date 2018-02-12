#!/bin/sh

allow_network=${1:-192.168.33.}
host_name=`hostname`

yum -y install samba
chkconfig smb on
chkconfig nmb on
chkconfig --list smb
chkconfig --list nmb

sed -i -e "s/^[\\t ][\\t ]*workgroup =.*/\\tworkgroup = WORKGROUP/" /etc/samba/smb.conf
sed -i -e "s/;[\\t ][\\t ]*netbios name =.*/\\tnetbios name = ${host_name}/" /etc/samba/smb.conf
sed -i -e "s/;[\\t ][\\t ]*hosts allow =.*/\\thosts allow = 127. ${allow_network}/" /etc/samba/smb.conf
sed -i -e "s/load printers =.*/load printers = no/" /etc/samba/smb.conf

echo -e "vagrant\nvagrant" | pdbedit -a -t -u vagrant

service smb restart
service nmb restart
