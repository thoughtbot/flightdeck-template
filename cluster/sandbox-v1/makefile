MAKEFILE_PATH := ../..
.PHONY: remake_default
remake_default: default

.remake.mk: $(wildcard $(MAKEFILE_PATH)/.*.mk)
	cat $(wildcard $(MAKEFILE_PATH)/.*.mk) > .remake.mk

include .remake.mk
