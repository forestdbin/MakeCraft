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


.PHONY : package
package : clean
	$(MAKE) build BUILD_TYPE=RELEASE
	rm -rf package
	mkdir -p package
	mv $(hello_exe) package
	mv package $(project)
	tar zcf $(project).tar.gz $(project)
	rm -rf $(project)

.PHONY : sources
sources :
	rm -rf $(project)_sources
	mkdir -p $(project)_sources
	cp $(hello_headers) $(hello_sources) $(project)_sources
	tar zcf $(project).sources.tar.gz $(project)_sources
	rm -rf $(project)_sources
