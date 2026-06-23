include make/vars.mk
include make/compilers.mk
include make/flags.mk
include make/libraries.mk
include make/project.mk

include make/build.mk
include make/run.mk

include make/test.mk
include make/coverage.mk
include make/profile.mk
include make/lint.mk

include make/install.mk

include make/clean.mk
include make/help.mk


.DEFAULT_GOAL := all
.PHONY : all
all : run
