hello_clean = \
	$(hello_exe) \
	$(hello_objects) \
	$(hello_depends) \
	$(hello_test) \
	$(hello_test_objects) \
	$(hello_test_depends)

hello_cov = \
	*.gcno \
	*.gcda \
	*.gcov \
	lcov.info \
	lcov_output \
	gcovr_output

.PHONY .SILENT : clean
clean :
	-@ echo clean
	-@ rm -rf $(hello_clean) $(hello_cov)
