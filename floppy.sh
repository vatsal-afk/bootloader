#!/bin/bash

# Create a blank floppy image and format it with FAT12
dd if=/dev/zero of=~/Desktop/bootloader/floppy.img bs=512 count=2880
mkfs.fat -F 12 ~/Desktop/bootloader/floppy.img

# Mount the floppy image
sudo mount -o loop ~/Desktop/bootloader/floppy.img /mnt

# Copy the bootloader to the boot sector
sudo dd if=~/Desktop/bootloader/boot.bin of=/mnt/bs=512 count=1 conv=notrunc

# Copy the kernel to the floppy image
sudo cp ~/Desktop/bootloader/kernel.bin /mnt/kernel.bin

# Unmount the floppy image
sudo umount /mnt

# Test the floppy image using QEMU
qemu-system-x86_64 -fda ~/Desktop/bootloader/floppy.img
