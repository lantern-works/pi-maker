MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/bash
.DEFAULT_GOAL := build

TAG?=latest
OS_IMAGE?=ArchLinuxARM-rpi-latest.tar.gz
OS_URI?=http://archlinuxarm.org/os/$(OS_IMAGE)
DATE := $(shell date +%s)

build:
	docker build -t "pi-maker:${TAG}" .

run:
	docker run -it --privileged \
		--volume ${PWD}/share:/tmp \
		-e OS_IMAGE="$(OS_IMAGE)" \
		-e OS_URI="$(OS_URI)" \
		-e SCRIPT_DIR="/tmp/my-scripts" \
		-e COPY_DIR="/tmp/copy-this" \
		-e SETUP_SCRIPT="/tmp/setup" \
		"pi-maker:${TAG}"
