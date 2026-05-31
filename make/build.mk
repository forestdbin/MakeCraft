.PHONY : build
build : $(hello_exe)

$(hello_exe) : $(hello_objects)
	$(CXX) -o $@ $(LDFLAGS) $^ $(LDLIBS)

%.o : %.cpp
	$(CXX) -o $@ $(CXXFLAGS) -c $<
