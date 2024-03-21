executable_hello = hello
executable_hello_objects = main.o
executable_hello_clean = $(executable_hello) $(executable_hello_objects)

dynamic_library_greet = greet
dynamic_library_greet_so = lib$(dynamic_library_greet).so
dynamic_library_greet_objects = greet.o
dynamic_library_greet_clean = $(dynamic_library_greet_so) $(dynamic_library_greet_objects)

$(executable_hello) : $(executable_hello_objects) $(dynamic_library_greet_so)
	g++ -o $@ $(executable_hello_objects) -L . -l $(dynamic_library_greet) -Wl,-rpath=.

$(dynamic_library_greet_so) : $(dynamic_library_greet_objects)
	g++ -shared -o $@ $^

%.o : %.cpp
	g++ -o $@ -c $^ -fPIC

clean :
	-@ rm -rf $(executable_hello_clean) $(dynamic_library_greet_clean)
