# Project parameters
VERSION ?= $(shell git describe --tags --always --dirty --match=v* || (echo "command failed $$?"; exit 1))
IMAGE ?= docker.io/vshn/fluentd-s3
IMAGE_NAME = $(IMAGE):$(VERSION)

.PHONY: all
all: build

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .
	@echo built image $(IMAGE_NAME)
