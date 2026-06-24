project = hello
hello_exe = $(project)

hello_sources = main.cpp greet.cpp
hello_objects = $(patsubst %.cpp,%.o,$(hello_sources))
hello_depends = $(hello_sources:.cpp=.d)
hello_headers = greet.h

hello_test = test_hello
hello_test_sources = test_main.cpp
hello_test_objects = $(hello_test_sources:.cpp=.o)
hello_test_depends = $(hello_test_sources:.cpp=.d)
