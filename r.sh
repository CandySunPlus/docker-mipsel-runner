#!/bin/sh

cp /lib/ld-musl-x86_64.so.1 lib/
cp /usr/bin/qemu-mipsel usr/bin/qemu-mipsel
cp /etc/resolv.conf etc/

mount --bind /dev dev
mount --bind /proc proc
mount --bind /sys sys

if [ -d "/share" ]; then
  mkdir /root/share
  mount -o move /share /root/share
fi

chroot . qemu-mipsel -E LD_LIBRARY_PATH=/lib:/opt/lib,PATH=/opt/sbin:/opt/bin:/usr/sbin:/usr/bin:/sbin:/bin "$@"
