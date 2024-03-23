COMPILER ?= GCC

ifeq ($(COMPILER),GCC)

CC = gcc
CXX = g++

else ifeq ($(COMPILER),CLANG)

CC = clang
CXX = clang++

endif
