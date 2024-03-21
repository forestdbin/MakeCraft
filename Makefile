executable_hello = hello
executable_hello_objects = main.o greet.o

$(executable_hello) : $(executable_hello_objects)
	g++ -o $@ $^

clean :
	-@ rm -rf $(executable_hello) $(executable_hello_objects)
