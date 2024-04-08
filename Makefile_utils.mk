.PHONY .SILENT : help
help :
	echo make $(project)
	echo -e '\tall'
	echo -e '\tbuild'
	echo -e '\trun'
	echo -e '\tclean'
	echo -e '\tdump'
	echo -e '\tdebug'
	echo -e '\ttest'
	echo -e '\tcoverage'
	echo -e '\t\tlcov'
	echo -e '\t\tgcovr'
	echo -e '\tprofile'
	echo -e '\tlint'
	echo -e '\tformat'
	echo -e '\tinstall'
	echo -e '\tuninstall'
	echo -e '\tpackage'

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
	echo -e \\tLDFALGS: $(LDFALGS)
	echo -e \\tLDLIBS: $(LDLIBS)

	echo USE_COMMON_HEADER: $(USE_COMMON_HEADER)
	echo PRE_COMPILE_HEADER: $(PRE_COMPILE_HEADER)
	echo

	echo INSTALL_PREFIX: $(INSTALL_PREFIX)
	echo INSTALL_DIR: $(INSTALL_DIR)
	echo

	echo USE_GOOGLE_TEST: $(USE_GOOGLE_TEST)
	echo

	echo project: $(project)
	echo $(project)_exe: $($(project)_exe)
	echo $(project)_common_header: $($(project)_common_header)
	echo $(project)_pre_compile_headers: $($(project)_pre_compile_headers)
	echo $(project)_pre_compiled_headers: $($(project)_pre_compiled_headers)
	echo $(project)_sources: $($(project)_sources)
	echo $(project)_objects: $($(project)_objects)
	echo $(project)_depends: $($(project)_depends)
	echo $(project)_clean: $($(project)_clean)
	echo

	echo $(project)_test: $($(project)_test)
	echo $(project)_test_sources: $($(project)_test_sources)
	echo $(project)_test_objects: $($(project)_test_objects)
