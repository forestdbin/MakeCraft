hello : main.o libgreet.so
	g++ -o $@ $< -L . -l greet -Wl,-rpath=.

libgreet.so : greet.o
	g++ -shared -o $@ $^

%.o : %.cpp
	g++ -o $@ -c $^ -fPIC

clean :
	-@ rm -rf hello libgreet.so *.o
