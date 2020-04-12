test: test.c libhamt.a hamt.h
	$(CC) -g test.c hamt.a -o test

libbgc.a:
	git submodule update --init --recursive
	$(MAKE) -C bgc
	ln -sf bgc/libbgc.a libbgc.a

libhamt.o: hamt.h hamt.c
	$(CC) -g -c hamt.c -o libhamt.o

hamt.a: libhamt.o
	ar rcs hamt.a libhamt.o

libhamt.a: hamt.a libbgc.a libhamt.mri
	ar -M <libhamt.mri