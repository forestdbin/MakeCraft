include make/vars.mk
include make/flags.mk
include make/project.mk
include make/build.mk
include make/run.mk
include make/clean.mk
include make/help.mk


.DEFAULT_GOAL := all
.PHONY : all
all : clean run
