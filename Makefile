executable_hello = hello
executable_hello_objects = $(patsubst %.cpp,%.o,$(wildcard *.cpp))
executable_hello_clean = $(executable_hello) $(executable_hello_objects)

$(executable_hello) : $(executable_hello_objects)
	g++ -o $@ $^

%.o : %.cpp
	g++ -o $@ -c $^ -include common.h

%.h.gch : %.h
	g++ -x c++-header $^

clean :
	-@ rm -rf $(executable_hello_clean)
