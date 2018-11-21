#!/bin/bash
as $1.s -o $1.o -g --32
ld $1.o -o $1.exe -g -m elf_i386
./$1.exe
