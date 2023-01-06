FROM alpine:3.17

WORKDIR /root/

ADD 4G.V2.0.8.CN.20220330.trx ./rom.trx

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \ 
    apk add squashfs-tools grep && \
    dd if=rom.trx of=rootfs.squashfs bs=1 skip=$(grep -oba hsqs ./rom.trx | grep -oP '[0-9]*(?=:hsqs)') && \
    unsquashfs -no-exit rootfs.squashfs


FROM alpine:3.17

WORKDIR /root/

COPY --from=0 /root/squashfs-root /root/

ADD r.sh /sbin/

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \ 
    apk --no-cache add qemu-mipsel && \
    rm -rf etc && mv etc_ro etc


ENTRYPOINT ["/sbin/r.sh"]

