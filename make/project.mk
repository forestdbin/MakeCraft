project = hello
hello_exe = $(project)

hello_sources = main.cpp greet.cpp
hello_objects = $(patsubst %.cpp,%.o,$(hello_sources))
