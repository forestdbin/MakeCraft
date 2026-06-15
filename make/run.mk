.PHONY : run
run : build
	./$(hello_exe)


.PHONY : debug
debug : build
	gdb --silent $(hello_exe)
