.PHONY : test
test : $(hello_test)
	./$(hello_test)

$(hello_test) : CXXFLAGS += $(CXXFLAGS_GOOGLETEST)
$(hello_test) : LDLIBS += $(LDLIBS_GOOGLETEST)
$(hello_test) : $(hello_test_objects)
	$(CXX) -o $@ $(LDFLAGS) $^ $(LDLIBS)

include $(hello_test_depends)
