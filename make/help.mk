.PHONY .SILENT : help
help :
	echo make $(project)
	echo -e '\tall'
	echo -e '\tbuild'
	echo -e '\trun'
	echo -e '\tclean'
	echo

	echo -e '\thelp'
	echo -e '\tdump'


.PHONY .SILENT : dump
dump :
	echo COMPILER: $(COMPILER)
	echo -e \\tCC: $(CC)
	echo -e \\tCXX: $(CXX)
	echo -e \\tTOOL_PATH: $(TOOL_PATH)
	echo -e \\tTOOL_PREFIX: $(TOOL_PREFIX)

	echo BUILD_TYPE: $(BUILD_TYPE)
	echo -e \\tCFLAGS: $(CFLAGS)
	echo -e \\tCXXFLAGS: $(CXXFLAGS)
	echo -e \\tLDFLAGS: $(LDFLAGS)
	echo -e \\tLDLIBS: $(LDLIBS)
	echo

	echo project: $(project)
	echo hello_exe: $(hello_exe)
	echo hello_sources: $(hello_sources)
	echo hello_objects: $(hello_objects)
	echo hello_clean: $(hello_clean)
