include Makefile_compiler.mk

executable_hello = hello
executable_hello_sources = $(wildcard *.cpp)
executable_hello_objects = $(patsubst %.cpp,%.o,$(executable_hello_sources))
executable_hello_depends = $(executable_hello_sources:.cpp=.d)
executable_hello_clean = $(executable_hello) $(executable_hello_objects) $(executable_hello_depends)

$(executable_hello) : $(executable_hello_objects)
	$(CXX) -o $@ $^

%.o : %.cpp
	$(CXX) -o $@ -c $< -include common.h

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
