# 42_libasm
The aim of this project is to get familiar with Assembly language, more specifically, 64 bits ASM, Intel syntax compiled with nasm.

# Resources
- Best starting point: https://www.youtube.com/playlist?list=PLmxT2pVYo5LB5EzTPZGfFN0c2GDiSXgQe
- More in-depth tutorial: https://www.youtube.com/playlist?list=PLKK11Ligqitg9MOX3-0tFT1Rmh3uJp7kA
- Best cheat sheet: https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html
- Most instructions: https://www.aldeid.com/wiki/X86-assembly/Instructions
- CMOVcc instructions (very useful for branchless conditionals): https://www.felixcloutier.com/x86/cmovcc
- Structures in asm (for bonus): https://www.csee.umbc.edu/courses/undergraduate/313/spring05/burt_katz/lectures/Lect10/structuresInAsm.html

Assembly is tricky to learn, in part, because there are several flavours (AT&T or Intel / 32bit or 64bit / Linux or Mac). So when checking out Assembly resources to complete the libasm project keep in mind a few things:
- The calling convention sets a few rules:
  - rdi - used to pass 1st argument to functions
  - rsi - used to pass 2nd argument to functions
  - rdx - used to pass 3rd argument to functions
  - rcx - used to pass 4th argument to functions
  - r8 - used to pass 5th argument to functions
  - r9 - used to pass 6th argument to functions
  - rax - used to define the return value of functions
- For syscalls:
  - The number of the syscall has to be passed in register rax
  - To execute a syscall, just use the syscall instruction without arguments
  - The kernel destroys registers rcx and r11
