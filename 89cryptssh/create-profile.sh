#! /bin/sh

luks_open=$1
device=$2
luksname=$3
echo "PATH='/sbin:/usr/sbin:$PATH'" >> /root/.profile
echo "echo Enter passwort to open $device as $luksname" >> /root/.profile
echo "echo $luks_open -T1 $device $luksname" >> /root/.profile
echo "$luks_open -T1 $device $luksname" >> /root/.profile
