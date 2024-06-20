# Assemble boot.asm
nasm -f bin -o ~/Desktop/bootloader/boot.bin ~/Desktop/bootloader/boot.asm

# Assemble kernel.asm
nasm -f bin -o ~/Desktop/bootloader/kernel.bin ~/Desktop/bootloader/kernel.asm

# Create a blank floppy image
dd if=/dev/zero of=~/Desktop/bootloader/floppy.img bs=512 count=2880

# Write the bootloader to the image
dd if=~/Desktop/bootloader/boot.bin of=~/Desktop/bootloader/floppy.img conv=notrunc

# Write the kernel to the image (starting at sector 2)
dd if=~/Desktop/bootloader/kernel.bin of=~/Desktop/bootloader/floppy.img bs=512 seek=2 conv=notrunc

# Test the floppy image using QEMU
qemu-system-x86_64 -fda ~/Desktop/bootloader/floppy.img
