from ubuntu:latest
RUN apt-get update && apt-get -y install \
    nodejs \
    npm \
    zip \
    wget \
    parted \
    udev \
    gcc-arm-linux-gnueabihf \
    binfmt-support \
    dosfstools \
    libc6-dev-armhf-cross \
    qemu \
    qemu-user-static
RUN ln -s `which nodejs` /usr/bin/node
RUN mkdir -p /tmp/pi-maker
COPY docker-entrypoint /usr/local/bin/docker-entrypoint
COPY bin/* /usr/local/bin/
ENTRYPOINT "/usr/local/bin/docker-entrypoint"