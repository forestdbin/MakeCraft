.PHONY : lint
lint : gen_compile_commands
	clang-tidy -p . -checks=* $(hello_sources)
