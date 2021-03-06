
stat-update: stat-update.c \
		vendor/libebb.a \
		vendor/libhiredis.a \
		vendor/libev.a
	gcc -Ivendor/libebb -Ivendor/libev -Ivendor/hiredis -std=c99 -c -o stat-update.o -O0 -ggdb stat-update.c
	gcc -o stat-update stat-update.o vendor/libebb.a vendor/libev.a vendor/libhiredis.a -lm

clean:
	rm -f stat-update *.o

distclean: clean
	rm -f vendor/*.a

vendor/libebb.a:
	cd vendor/libebb; make libebb.a && mv libebb.a ..

vendor/libhiredis.a:
	cd vendor/hiredis; make && cp libhiredis.a ..

vendor/libev.a:
	cd vendor/libev; ./configure --disable-shared && make && cp .libs/libev.a ..
