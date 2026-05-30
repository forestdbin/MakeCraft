hello_clean = \
	$(hello_exe) \
	$(hello_objects)

.PHONY .SILENT : clean
clean :
	-@ rm -rf $(hello_clean)
