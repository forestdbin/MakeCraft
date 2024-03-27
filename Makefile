include Makefile_vars.mk
include Makefile_compiler.mk
include Makefile_flags.mk
include Makefile_headers.mk
include Makefile_utils.mk

project = hello
$(project)_exe = $(project)

$(project)_common_header = common.h
$(project)_pre_compile_headers = $($(project)_common_header) # $(wildcard *.h)
$(project)_pre_compiled_headers = $($(project)_pre_compile_headers:.h=.h.gch)

$(project)_sources = $(wildcard *.cpp)
$(project)_objects = $(patsubst %.cpp,%.o,$($(project)_sources))
$(project)_depends = $($(project)_sources:.cpp=.d)

$(project)_clean = \
	$($(project)_exe) \
	$($(project)_objects) \
	$($(project)_depends) \
	$($(project)_pre_compiled_headers)

.DEFAULT_GOAL := all
.PHONY : all
all : build

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
