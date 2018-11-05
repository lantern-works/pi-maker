FROM multiarch/alpine:armhf-v3.8

RUN apk update && apk upgrade
RUN apk add \
zip \
wget \
parted \
udev \
file \
bash \
dosfstools \
util-linux \
coreutils \
e2fsprogs \
libcap \
shadow \
qemu

COPY bin/* /usr/local/bin/

ENTRYPOINT "/usr/local/bin/entrypoint"
