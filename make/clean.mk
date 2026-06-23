hello_clean = \
	$(hello_exe) \
	$(hello_objects) \
	$(hello_depends) \
	$(hello_test) \
	$(hello_test_objects) \
	$(hello_test_depends) \
	compile_commands.json

hello_cov = \
	*.gcno \
	*.gcda \
	*.gcov \
	lcov.info \
	lcov_output \
	gcovr_output

hello_prof = \
	gmon.out

hello_format = \
	*~ \
	*.orig

.PHONY .SILENT : clean
clean :
	-@ echo clean
	-@ rm -rf $(hello_clean) $(hello_cov) $(hello_prof) $(hello_format)
