#!/bin/sh

qemu-mipsel -L . -E LD_LIBRARY_PATH=./lib:./opt/lib,PATH=./opt/sbin:./opt/bin:./usr/sbin:./usr/bin:./sbin:./bin "$@"
