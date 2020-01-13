all: fproj method

simple_io.o: simple_io.asm
	nasm -felf64 -o simple_io.o simple_io.asm
fproj.o: fproj.asm simple_io.inc
	nasm -felf64 -o fproj.o fproj.asm
fproj: driver.c fproj.o simple_io.o
	gcc -o fproj driver.c fproj.o simple_io.o
method.o: method.asm simple_io.inc
	nasm -felf64 -o method.o method.asm
method: driver.c method.o simple_io.o
	gcc -o method driver.c method.o simple_io.o

clean:
	rm *.o fproj method
