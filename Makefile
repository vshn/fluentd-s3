# Project parameters
VERSION ?= $(shell git describe --tags --always --dirty --match=v* || (echo "command failed $$?"; exit 1))
IMAGE_NAME ?= docker.io/vshn/fluentd-s3:$(VERSION)

.PHONY: all
all: build

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .
	@echo built image $(IMAGE_NAME)
