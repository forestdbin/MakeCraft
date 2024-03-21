executable_hello = hello
executable_hello_objects = $(patsubst %.cpp,%.o,$(wildcard *.cpp))
executable_hello_clean = $(executable_hello) $(executable_hello_objects)

$(executable_hello) : $(executable_hello_objects)
	g++ -o $@ $^

clean :
	-@ rm -rf $(executable_hello_clean)
