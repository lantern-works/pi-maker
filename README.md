
# pi-maker

### Getting Started

```bash
make && make run
```

A new disk image for Raspberry Pi will appear inside this project folder within "share/build". This solution has been tested with Raspberry Pi Zero W and may work for other models, too. 


### Next: Flash With Desktop App

[Download Etcher](http://etcher.io)

Open the desktop application and follow the prompts to select the disk image and the desired SD Card to use.

### Or: Flash With Command Line

[Install Etcher CLI](https://etcher.io/cli/)

Run the commands below and the terminal will prompt you to select the desired drive to install to. Please be careful to select the proper SD Card and not another disk to avoid unwanted data loss.

```bash
make && make run
sudo etcher ./share/build/rpi.img
```


### Requirements

A local [Docker](https://www.docker.com/community-edition) environment is required in order to build an image.

Ubuntu users should install these packages before building an image:
```bash
apt-get install binfmt-support qemu-user-static make
```


## Reference
- [Raspberry Pi: How to Install and Configure Archlinux ARM](http://populationinversion.com/posts/raspberrypi-install-and-configure-archlinux-arm/)
- [Create Custom ArchlinuxArm Images for the Raspberry Pi](https://disconnected.systems/blog/raspberry-pi-archlinuxarm-setup)
- [Building ARM containers on any x86 machine, even DockerHub](https://resin.io/blog/building-arm-containers-on-any-x86-machine-even-dockerhub/)

### Disclaimer
This repository is under active development and not yet intended for widespread use.