COMPILER ?= GCC

ifeq ($(COMPILER),GCC)

CC = gcc
CXX = g++

else ifeq ($(COMPILER),CLANG)

CC = clang
CXX = clang++

else ifeq ($(COMPILER),AARCH64_LINUX_GNU_GCC)

# TOOL_PATH = /usr/bin/
TOOL_PREFIX = aarch64-linux-gnu-

CC = $(TOOL_PREFIX)gcc
CXX = $(TOOL_PREFIX)g++

endif
