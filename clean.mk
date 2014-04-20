#!/usr/bin/make -f
include dwm/config.mk

.PHONY: all build clean

all: build

build: dwm/dwm.c patches/series README.md clean.sh
	./clean.sh "$(VERSION)" $(ARGS)

clean:
	-QUILT_SERIES=single_series QUILT_PATCHES=patches quilt pop -a
	-rm -rf $(VERSION)
	-rm -f dwm/*.rej dwm/*.orig
