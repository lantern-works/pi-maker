
# pi-maker

### Getting Started

```bash
make && make run
```

### Flashing Your Image

[Download Etcher](http://etcher.io)

A new image file will appear in your "share/build" folder. Select this in Etcher and flash your SD Card and your Raspberry Pi is ready to go.

### Requirements

A local [Docker](https://www.docker.com/community-edition) environment is required in order to build an image.

Ubuntu users should install these packages before building an image:
```bash
apt-get install binfmt-support qemu-user-static make
```

### Customization

By exporting `OS_IMAGE` and `OS_URI` you can use a different operating system, like so:

```bash
# Creating a rasbian image requires grabbing both boot and root which are separated o_O
pushd share/build
wget http://vx2-downloads.raspberrypi.org/raspbian_lite/archive/2018-06-29-03:25/boot.tar.xz
wget http://vx2-downloads.raspberrypi.org/raspbian_lite/archive/2018-06-29-03:25/root.tar.xz
xzcat root.tar.xz boot.tar.xz | xz -c > combined.tar.xz
export OS_IMAGE=combined.tar.xz
popd
make run
```

## Reference
- [Raspberry Pi: How to Install and Configure Archlinux ARM](http://populationinversion.com/posts/raspberrypi-install-and-configure-archlinux-arm/)
- [Create Custom ArchlinuxArm Images for the Raspberry Pi](https://disconnected.systems/blog/raspberry-pi-archlinuxarm-setup)
- [Building ARM containers on any x86 machine, even DockerHub](https://resin.io/blog/building-arm-containers-on-any-x86-machine-even-dockerhub/)

### Disclaimer
This repository is under active development and not yet intended for widespread use.
