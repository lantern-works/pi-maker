MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/bash

TAG?=latest
OS_IMAGE?=ArchLinuxARM-rpi-latest.tar.gz
OS_URI?=http://archlinuxarm.org/os/$(OS_IMAGE)
IMAGE_SIZE?=3G

build:
	docker run --rm --privileged multiarch/qemu-user-static:register --reset
	docker build -t "pi-maker:${TAG}" .

run:
	docker run -it --privileged \
		--volume ${PWD}/share:/tmp \
		-e OS_IMAGE="$(OS_IMAGE)" \
		-e OS_URI="$(OS_URI)" \
		-e SCRIPT_DIR="/tmp/my-scripts" \
		-e COPY_DIR="/tmp/copy-this" \
		-e SETUP_SCRIPT="/tmp/setup" \
		-e IMAGE_SIZE=$(IMAGE_SIZE) \
		"pi-maker:${TAG}"

flash: build run
	etcher ./share/build/rpi.img
