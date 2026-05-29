executable_hello = hello
executable_hello_objects = main.o
executable_hello_clean = $(executable_hello) $(executable_hello_objects)

static_library_greet = greet
static_library_greet_a = lib$(static_library_greet).a
static_library_greet_objects = greet.o
static_library_greet_clean = $(static_library_greet_a) $(static_library_greet_objects)

$(executable_hello) : $(executable_hello_objects) $(static_library_greet_a)
	g++ -o $@ $(executable_hello_objects) -L . -l $(static_library_greet)

$(static_library_greet_a) : $(static_library_greet_objects)
	ar crs $@ $(static_library_greet_objects)

%.o : %.cpp
	g++ -o $@ -c $^ -include common.h

clean :
	-@ rm -rf $(executable_hello_clean) $(static_library_greet_clean)
