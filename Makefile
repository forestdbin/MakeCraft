executable_hello = hello
executable_hello_sources = $(wildcard *.cpp)
executable_hello_objects = $(patsubst %.cpp,%.o,$(executable_hello_sources))
executable_hello_depends = $(executable_hello_sources:.cpp=.d)
executable_hello_clean = $(executable_hello) $(executable_hello_objects) $(executable_hello_depends)

$(executable_hello) : $(executable_hello_objects)
	g++ -o $@ $^

%.o : %.cpp
	g++ -o $@ -c $< -include common.h

%.h.gch : %.h
	g++ -x c++-header $^

%.d : %.cpp
	# g++ -MM -MF $@ $^
	@set -e; rm -f $@; \
     g++ -MM $< > $@.$$$$; \
     sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
     rm -f $@.$$$$

include $(executable_hello_depends)

clean :
	-@ rm -rf $(executable_hello_clean)
