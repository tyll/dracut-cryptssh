Installation
============

Install dracut-network dropbear

dropbearkey -t rsa -s 3072 -f /etc/dracut-cryptssh/dropbear_rsa_host_key

Add to kernel commandline:
rd.ip=dhcp netroot=dhcp rd.cryptssh=1

Architecture
============

- Use dracut-network to setup network
- Modify 90crypt/cryptroot-ask
    - Put unlock information into /root/.profile
    - Terminate console prompt when volume is unlocked
        - Requires wait_for_file, which requires ask_for_password to be
          wrapped
        - wait_for_file terminates process when watchfile exists 
- Modify initramfs to run custom cryptroot-ask instead of original one:
    - Start dropbear (no proper hook is available): It needs to be after
      network module was loaded but before crypto devices are unlooked. Both
      happens via udev
    - Afterwards run modified script (see above)

References/Credits
==================
This dracut module is inspired by information found at the following URLs:
- http://roosbertl.blogspot.de/2012/12/centos6-disk-encryption-with-remote.html
- https://bitbucket.org/bmearns/dracut-crypt-wait
- https://bugzilla.redhat.com/show_bug.cgi?id=524727
