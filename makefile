MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/bash
.DEFAULT_GOAL := build

TAG?=latest
DATE := $(shell date +%s)

build:
	docker build -t "pi-maker:${TAG}" .

run:
	docker run -it --privileged \
		--volume ${PWD}/share:/tmp \
		-e SCRIPT_DIR="/tmp/my-scripts" \
		-e COPY_DIR="/tmp/copy-this" \
		-e SETUP_SCRIPT="/tmp/setup" \
		-e OS_URI="${OS_URI}" \
		-e OS_IMAGE="${OS_IMAGE}" \
		"pi-maker:${TAG}"
