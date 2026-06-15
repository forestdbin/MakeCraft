# when compiling with --coverage, it outputs *.gcno
# when running with --coverage, it outputs *.gcda
# when running gcov, it outputs *.gcov

# gcov
#  -k --use-colors
#  -l --long-file-names
#  -m --demangled-names
#  -r --relative-only
#  -n --no-output
#  -t --stdout
# gcov -k -l -m -r -n foo.cpp
# gcov -k -l -m -r -t foo.cpp | less -R
# gcov -k -l -m -r foo.cpp
# gcov -m -r foo.cpp

.PHONY : coverage
coverage : CXXFLAGS += --coverage
coverage : LDLIBS += --coverage
coverage : $(hello_exe)
	./$(hello_exe)
	gcov $(hello_sources)
	view *.gcov
