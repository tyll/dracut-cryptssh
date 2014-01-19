#!/bin/sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

done_file=/var/tmp/cryptssh

if [ ! -e $done_file ]
then
    mkdir -p /var/log
    >> /var/log/lastlog

    info "cryptssh: Starting dropbear..."
    /usr/sbin/dropbear -s -E -P /tmp/dropbear.pid
    info "cryptssh: Dropbear status: $?"
fi
>> $done_file
exec /sbin/cryptroot-ask-wait_for_file "${@}"
