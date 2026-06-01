hello : main.o
	time -p g++ -o hello main.o

main.o : main.cc | pre_compile_header
	time -p g++ -o main.o -include common.h -c main.cc

clean :
	-@ rm -rf hello main.o common.h.gch

pre_compile_header : common.h.gch

common.h.gch : common.h
	time -p g++ -x c++-header common.h
