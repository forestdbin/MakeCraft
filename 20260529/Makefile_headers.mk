# common header
USE_COMMON_HEADER ?= TRUE

ifeq ($(USE_COMMON_HEADER),TRUE)

CXXFLAGS += -include $($(project)_common_header)

endif


# pre compile header
PRE_COMPILE_HEADER ?= TRUE

ifeq ($(PRE_COMPILE_HEADER),TRUE)

%.h.gch : %.h
	$(CXX) -x c++-header $(subst $  -include $($(project)_common_header),,$(CXXFLAGS)) $^

endif


# auto depends
%.d : %.cpp
	# $(CXX) -MM -MF $@ $(CXXFLAGS) $^
	@set -e; rm -f $@; \
     $(CXX) -MM $(CXXFLAGS) $< > $@.$$$$; \
     sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
     rm -f $@.$$$$
