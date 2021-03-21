#!/bin/bash

OS=`uname`
if [ $OS == "Linux" ]; then
	`nasm -f elf64 $1`
else
	`nasm -f macho64 $1`
fi
ld *.o
./a.out
echo $?
rm a.out *.o
