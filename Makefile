include Makefile_compiler.mk

executable_hello = hello
executable_hello_sources = $(wildcard *.cpp)
executable_hello_objects = $(patsubst %.cpp,%.o,$(executable_hello_sources))
executable_hello_depends = $(executable_hello_sources:.cpp=.d)
executable_hello_clean = $(precompiled_common_header) \
	$(executable_hello) $(executable_hello_objects) $(executable_hello_depends)

common_header = common.h
precompiled_common_header = $(common_header).gch

build : $(precompiled_common_header) $(executable_hello)

$(executable_hello) : $(executable_hello_objects)
	$(CXX) -o $@ $^

%.o : %.cpp $(common_header)
	$(CXX) -o $@ -c $< -include $(common_header)

%.h.gch : %.h
	$(CXX) -x c++-header $^

%.d : %.cpp
	# $(CXX) -MM -MF $@ $^
	@set -e; rm -f $@; \
     $(CXX) -MM $< > $@.$$$$; \
     sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
     rm -f $@.$$$$

include $(executable_hello_depends)

clean :
	-@ rm -rf $(executable_hello_clean)
