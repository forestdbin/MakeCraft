hello_clean = \
	$(hello_exe) \
	$(hello_objects) \
	$(hello_depends)

.PHONY .SILENT : clean
clean :
	-@ rm -rf $(hello_clean)
