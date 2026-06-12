.PHONY : build
build : $(hello_exe)

$(hello_exe) : $(hello_objects)
	$(CXX) -o $@ $(LDFLAGS) $^ $(LDLIBS)

%.o : %.cpp
	$(CXX) -o $@ $(CXXFLAGS) -c $<

# auto depends
%.d : %.cpp
	# $(CXX) -MM -MF $@ $(CXXFLAGS) $^
	@set -e; rm -f $@; \
     $(CXX) -MM $(CXXFLAGS) $< > $@.$$$$; \
     sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
     rm -f $@.$$$$

include $(hello_depends)


.PHONY : release
release : clean
	$(MAKE) build BUILD_TYPE=RELEASE
