How to Run
---
The container will chroot to the mipsel rootfs, so we need to bind mount `/dev`, `/proc` and `/sys` to mipsel rootfs, which require docker `SYS_ADMIN` permission. 

You can access mipsel's shell environment in this way:
```shell
docker run --rm --cap-add=SYS_ADMIN -it candysunplus/mipsel-runner:alpine /bin/sh
```

## Mount share data to container

The container only supports mounting `/share` to mipsel rootfs, if you want to share host files to the container, you need to mount the host share directory to the `/share` mount point.

```shell
docker run --rm --cap-add=SYS_ADMIN -it -v $PWD:/share candysunplus/mipsel-runner:alpine /bin/ash
```
