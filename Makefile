include Makefile_compiler.mk
include Makefile_flags.mk
include Makefile_headers.mk

executable_hello = hello
executable_hello_sources = $(wildcard *.cpp)
executable_hello_objects = $(patsubst %.cpp,%.o,$(executable_hello_sources))
executable_hello_depends = $(executable_hello_sources:.cpp=.d)
executable_hello_clean = $(precompiled_headers) \
	$(executable_hello) $(executable_hello_objects) $(executable_hello_depends)

build : $(precompiled_headers) $(executable_hello)

$(executable_hello) : $(executable_hello_objects)
	$(CXX) -o $@ $(LDFALGS) $^ $(LDLIBS)

%.o : %.cpp
	$(CXX) -o $@ $(CXXFLAGS) -c $<

include $(executable_hello_depends)

clean :
	-@ rm -rf $(executable_hello_clean)
