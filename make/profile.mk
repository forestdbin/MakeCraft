# the program is compiled with -pg
# when it runs, it outputs call graph profile file, gmon.out

# when gprof runs, it outputs an execution profile of the program

.PHONY : profile
profile : CXXFLAGS += -pg
profile : LDLIBS += -pg
profile : $(hello_exe)
	./$(hello_exe)
	gprof $(hello_exe)
