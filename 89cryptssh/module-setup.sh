# vim: ts=8 sw=4 sts=4 et filetype=sh

dropbear_bin=/usr/sbin/dropbear

check() {
    test -f ${dropbear_bin} && \
    return 0
    return 1
}

install() {
    # dropbear files
    inst $dropbear_bin "/usr/sbin/dropbear"
    inst_dir "/etc/dropbear"
    inst /etc/dracut-cryptssh/dropbear_rsa_host_key "/etc/dropbear/dropbear_rsa_host_key"
    inst /root/.ssh/authorized_keys "/root/.ssh/authorized_keys"
    inst_simple "${moddir}/passwd" "/etc/passwd"
    inst_simple "${moddir}/shells" "/etc/shells"

    # used to kill dropbear sessions
    inst /usr/bin/pkill
    inst_hook pre-pivot 10 "$moddir/kill-dropbear.sh"

    # to peek into consoles
    inst /usr/bin/setterm
    inst $moddir/peak_console.sh /sbin/peak_console.sh

    # cryptroot-ask replacement scripts
    inst /usr/libexec/dracut-cryptssh/wait_for_file /bin/wait_for_file
    inst "$moddir"/create-profile.sh /sbin/create-profile
    inst "$moddir"/cryptroot-ask-wait_for_file.sh /sbin/cryptroot-ask-wait_for_file
    inst "$moddir"/cryptroot-ask-dropbear.sh /sbin/cryptroot-ask-dropbear
    inst "$moddir"/ask_for_password-wrapper.sh /sbin/ask_for_password

    # setup hook
    inst_hook cmdline 5 "$moddir/parse-cryptssh.sh"
}

installkernel() {
    return 0
}
