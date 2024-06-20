script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Assemble boot.asm
nasm -f bin -o "$script_dir/boot.bin" "$script_dir/boot.asm"

# Assemble kernel.asm
nasm -f bin -o "$script_dir/kernel.bin" "$script_dir/kernel.asm"

# Create a blank floppy image
dd if=/dev/zero of="$script_dir/floppy.img" bs=512 count=2880

# Write the bootloader to the image
dd if="$script_dir/boot.bin" of="$script_dir/floppy.img" conv=notrunc

# Write the kernel to the image (starting at sector 2)
dd if="$script_dir/kernel.bin" of="$script_dir/floppy.img" bs=512 seek=2 conv=notrunc

# Test the floppy image using QEMU
qemu-system-x86_64 -fda "$script_dir/floppy.img"
