.PHONY : build
build : $(hello_exe)

$(hello_exe) : $(hello_objects)
	c++ -o $@ $(LDFLAGS) $^ $(LDLIBS)

%.o : %.cpp
	c++ -o $@ $(CXXFLAGS) -c $<
