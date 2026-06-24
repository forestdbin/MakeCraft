.PHONY .SILENT : help
help :
	echo make $(project)
	echo -e '\tall'
	echo -e '\tbuild'
	echo -e '\trelease'
	echo -e '\tgen_compile_commands'
	echo -e '\trun'
	echo -e '\tdebug'
	echo -e '\tclean'
	echo

	echo -e '\ttest'
	echo -e '\tcoverage'
	echo -e '\tlcov'
	echo -e '\tgcovr'
	echo -e '\tprofile'
	echo -e '\tlint'
	echo -e '\tformat'
	echo

	echo -e '\tinstall'
	echo -e '\tuninstall'
	echo -e '\tpackage'
	echo -e '\tsources'
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

	echo INSTALL_PREFIX: $(INSTALL_PREFIX)
	echo INSTALL_DIR: $(INSTALL_DIR)
	echo

	echo USE_BOOST: $(USE_BOOST)
	echo USE_GOOGLE_TEST: $(USE_GOOGLE_TEST)
	echo USE_NLOHMANN_JSON: $(USE_NLOHMANN_JSON)
	echo

	echo project: $(project)
	echo hello_exe: $(hello_exe)
	echo hello_sources: $(hello_sources)
	echo hello_objects: $(hello_objects)
	echo hello_depends: $(hello_depends)
	echo hello_test: $(hello_test)
	echo hello_test_sources: $(hello_test_sources)
	echo hello_test_objects: $(hello_test_objects)
	echo hello_test_depends: $(hello_test_depends)
	echo hello_clean: $(hello_clean) $(hello_cov) $(hello_prof) $(hello_format)
