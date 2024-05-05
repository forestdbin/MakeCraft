# google test
USE_GOOGLE_TEST ?= TRUE

ifeq ($(USE_GOOGLE_TEST),TRUE)

CXXFLAGS_GOOGLETEST = $(shell PKG_CONFIG_PATH=ext/googletest/lib/pkgconfig pkg-config --cflags gtest)
LDLIBS_GOOGLETEST = $(shell PKG_CONFIG_PATH=ext/googletest/lib/pkgconfig pkg-config --libs gtest_main)

endif


# nlohmann json
USE_NLOHMANN_JSON ?= TRUE

ifeq ($(USE_NLOHMANN_JSON),TRUE)

CXXFLAGS_JSON = $(shell PKG_CONFIG_PATH=ext/json/share/pkgconfig pkg-config --cflags nlohmann_json)
CXXFLAGS += $(CXXFLAGS_JSON)

endif


# Boost
USE_BOOST ?= TRUE

ifeq ($(USE_BOOST),TRUE)

CXXFLAGS_BOOST = -I ~/git/MakeCraft/ext/boost/include
LDFLAGS_BOOST = -L ~/git/MakeCraft/ext/boost/lib
LDLIBS_BOOST =

CXXFLAGS += $(CXXFLAGS_BOOST)
LDFLAGS += $(LDFLAGS_BOOST)
LDLIBS += $(LDLIBS_BOOST)

endif
