#!/bin/sh

pidfile=/tmp/dropbear.pid
[ -e $pidfile ] || exit 0
read PID < $pidfile

# stop listening process
kill -SIGSTOP $PID

# Kill all child processes
pkill -P $PID

# Kill listening process
kill $PID
kill -SIGCONT $PID
