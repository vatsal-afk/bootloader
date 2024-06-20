#!/bin/bash

# Assemble boot.asm
nasm -f bin -o ~/Desktop/bootloader/boot.bin ~/Desktop/bootloader/boot.asm

# Assemble kernel.asm
nasm -f bin -o ~/Desktop/bootloader/kernel.bin ~/Desktop/bootloader/kernel.asm
