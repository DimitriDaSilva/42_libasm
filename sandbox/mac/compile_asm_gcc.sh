#!/bin/bash

OS=`uname`
if [ $OS == "Linux" ]; then
	`nasm -f elf64 $1`
	`gcc *.o`
else
	`nasm -f macho64 $1`
	`gcc *.o`
fi
./a.out
echo $?
rm a.out *.o
