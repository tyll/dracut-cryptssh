#!/bin/sh
# from https://github.com/mk-fg/dracut-crypt-sshd/blob/master/60dropbear-sshd/console_peek.sh
N=${1:-1}
exec setterm -term linux -dump "$N" -file /proc/self/fd/1
