#!/bin/bash

OS=`uname`
if [ $OS == "Linux" ]; then
	`nasm -f elf64 $1`
	`ld *.o`
else
	`nasm -f macho64 $1`
	`ld -e _start *.o -lSystem -macosx_version_min 11.0`
fi
./a.out
echo $?
rm a.out *.o
