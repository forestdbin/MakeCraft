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
