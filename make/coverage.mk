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
	gcov -m -r $(hello_sources)
	# view *.gcov


# lcov collects coverage data (*.gcda)
# genhtml creates HTML pages

.PHONY : lcov
lcov : coverage
	lcov -c -d . -o lcov.info --rc lcov_branch_coverage=1 # --no-recursion
	lcov -l lcov.info --rc lcov_branch_coverage=1
	[ -d lcov_output ] && rm -rf lcov_output/* || mkdir lcov_output
	genhtml -o lcov_output lcov.info --branch-coverage
	# python3 -m http.server --directory lcov_output


# gcovr deletes *.gcov after reporting
#  -s, --print-summary
#  -b, --branches
#  -r ROOT, --root ROOT

.PHONY : gcovr
gcovr : coverage
	gcovr -s # --exclude-directories test
	gcovr -b
	# gcovr -r . # -b
	[ -d gcovr_output ] && rm -rf gcovr_output/* || mkdir gcovr_output
	gcovr -r . --html --html-details -o gcovr_output/index.html
	# python3 -m http.server --directory gcovr_output
