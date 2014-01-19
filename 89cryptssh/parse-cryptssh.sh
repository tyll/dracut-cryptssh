#!/bin/sh
# vim: ts=8 sw=4 sts=4 et filetype=sh

# replace cryptroot-ask if rd.cryptssh is set on kernel cmdline
if getarg rd.cryptssh
then
	info "cryptssh: replacing cryptroot-ask"
	[ -e /sbin/cryptroot-ask ] && mv -f /sbin/cryptroot-ask /sbin/cryptroot-ask-orig
	cp -a /sbin/cryptroot-ask-dropbear /sbin/cryptroot-ask
else
    info "cryptssh: rd.cryptssh not set, will not replace cryptroot-ask"
fi
