INSTALL_PREFIX ?= /usr/local

INSTALL_DIR = $(INSTALL_PREFIX)/$(project)

.PHONY : install
install : release
	sudo install -d $(INSTALL_DIR)
	sudo install -t $(INSTALL_DIR) $(hello_exe)
	sudo ln -sf ../hello/hello $(INSTALL_PREFIX)/bin

.PHONY : uninstall
uninstall :
	sudo rm -i $(INSTALL_PREFIX)/bin/$(hello_exe)
	sudo rm -i -r $(INSTALL_DIR)
