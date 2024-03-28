# google test
USE_GOOGLE_TEST ?= TRUE

ifeq ($(USE_GOOGLE_TEST),TRUE)

CXXFLAGS_GOOGLETEST = $(shell PKG_CONFIG_PATH=ext/googletest/lib/pkgconfig pkg-config --cflags gtest)
LDLIBS_GOOGLETEST = $(shell PKG_CONFIG_PATH=ext/googletest/lib/pkgconfig pkg-config --libs gtest_main)

endif
