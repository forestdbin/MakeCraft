# common header
USE_COMMON_HEADER ?= TRUE

ifeq ($(USE_COMMON_HEADER),TRUE)

common_header = common.h

CXXFLAGS += -include $(common_header)

endif


# pre compile header
PRE_COMPILED_HEADER ?= TRUE

ifeq ($(PRE_COMPILED_HEADER),TRUE)

precompiled_headers = $(common_header).gch # other *.h.gch

%.h.gch : %.h
	$(CXX) -x c++-header $(subst $  -include $(common_header),,$(CXXFLAGS)) $^

endif


# auto depends
%.d : %.cpp
	# $(CXX) -MM -MF $@ $(CXXFLAGS) $^
	@set -e; rm -f $@; \
     $(CXX) -MM $(CXXFLAGS) $< > $@.$$$$; \
     sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
     rm -f $@.$$$$
