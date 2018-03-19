MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail
.DEFAULT_GOAL := build

TAG?=latest
DATE := $(shell date +%s)

build:
	docker build -t "pi-maker:${TAG}" .

run:
	docker run -it --privileged --volume ${PWD}/share:/tmp "pi-maker:${TAG}"