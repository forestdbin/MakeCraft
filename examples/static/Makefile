hello : main.o libgreet.a
	g++ -o $@ $< -L . -l greet

libgreet.a : greet.o
	ar crs $@ $^

%.o : %.cpp
	g++ -o $@ -c $^

clean :
	-@ rm -rf hello libgreet.a *.o
