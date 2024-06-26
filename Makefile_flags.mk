BUILD_TYPE ?= DEBUG

# CFLAGS = -std=c11
CXXFLAGS = -std=c++17 -Wall -Wextra -Wpedantic -pthread

LDFLAGS = -pthread
LDLIBS =

ifeq ($(BUILD_TYPE),DEBUG)

CXXFLAGS += -g -D DEBUG

else ifeq ($(BUILD_TYPE),RELEASE)

CXXFLAGS += -O -D NDEBUG
LDFLAGS += -s

endif
