hello_clean = \
	$(hello_exe) \
	$(hello_objects) \
	$(hello_depends) \
	$(hello_test) \
	$(hello_test_objects) \
	$(hello_test_depends)

.PHONY .SILENT : clean
clean :
	-@ echo clean
	-@ rm -rf $(hello_clean)
