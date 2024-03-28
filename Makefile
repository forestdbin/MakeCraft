include Makefile_vars.mk
include Makefile_compiler.mk
include Makefile_flags.mk
include Makefile_headers.mk
include Makefile_libs.mk
include Makefile_utils.mk


project = hello
$(project)_exe = $(project)

$(project)_common_header = common.h
$(project)_pre_compile_headers = $($(project)_common_header) # $(wildcard *.h)
$(project)_pre_compiled_headers = $($(project)_pre_compile_headers:.h=.h.gch)

$(project)_sources = main.cpp greet.cpp
$(project)_objects = $(patsubst %.cpp,%.o,$($(project)_sources))
$(project)_depends = $($(project)_sources:.cpp=.d)

$(project)_clean = \
	$($(project)_exe) \
	$($(project)_objects) \
	$($(project)_depends) \
	$($(project)_pre_compiled_headers) \
	$($(project)_test) \
	$($(project)_test_objects) \
	*.gcno *.gcda *.gcov *.info

$(project)_test = test_$(project)
$(project)_test_sources = test_main.cpp
$(project)_test_objects = $($(project)_test_sources:.cpp=.o)
$(project)_depends += $($(project)_test_sources:.cpp=.d)


.DEFAULT_GOAL := all
.PHONY : all
all : run


.PHONY : build
build : $($(project)_pre_compiled_headers) $($(project)_exe)

$($(project)_exe) : $($(project)_objects)
	$(CXX) -o $@ $(LDFALGS) $^ $(LDLIBS)

%.o : %.cpp
	$(CXX) -o $@ $(CXXFLAGS) -c $<

include $($(project)_depends)


.PHONY : run
run : build
	./$($(project)_exe)


.PHONY .SILENT : clean
clean :
	-@ rm -rf $($(project)_clean)


.PHONY : debug
debug : build
	gdb --silent $($(project)_exe)


.PHONY : test
test : $($(project)_pre_compiled_headers) $($(project)_test)
	./$($(project)_test)

$($(project)_test) : CXXFLAGS += $(CXXFLAGS_GOOGLETEST)
$($(project)_test) : LDLIBS += $(LDLIBS_GOOGLETEST)
$($(project)_test) : $($(project)_test_objects)
	$(CXX) -o $@ $(LDFALGS) $^ $(LDLIBS)


.PHONY : coverage
coverage : CXXFLAGS += --coverage
coverage : LDLIBS += --coverage
coverage : $($(project)_pre_compiled_headers) $($(project)_exe)
	# ./$($(project)_exe)
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
	# view *.gcov

.PHONY : lcov
lcov : coverage
	# lcov -c -d . -o lcov.info --rc lcov_branch_coverage=1 # --no-recursion
	# lcov -l lcov.info --rc lcov_branch_coverage=1
	# [ -d output ] && rm -rf output/* || mkdir output
	# genhtml -o output lcov.info --branch-coverage
	# python3 -m http.server --directory output
	# rm -rf output

.PHONY : gcovr
gcovr : coverage
	# gcovr -s --exclude-directories test
	# gcovr -b
	# gcovr -r . # -b
	# [ -d output ] && rm -rf output/* || mkdir output
	# gcovr -r . --html --html-details -o output/index.html
	# python3 -m http.server --directory output
	# rm -rf output
