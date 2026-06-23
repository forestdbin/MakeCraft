.PHONY : lint
lint : gen_compile_commands
	clang-tidy -p . -checks=* $(hello_sources)


# indent
#  -gnu, --gnu-style
#  -kr, --k-and-r-style
#  -linux, --linux-style
#  -orig, --original
# main.cpp~ backup

# astyle
#  --style=allman
#  --style=kr
#  --style=stroustrup
# main.cpp.orig backup

# clang-format -i --style=
#  LLVM
#  Google
#  Chromium
#  Mozilla
#  WebKit

.PHONY : format
format :
	# indent -kr $(hello_sources)
	# astyle --style=kr $(hello_sources)
	# clang-format -i --style=LLVM $(hello_sources)
