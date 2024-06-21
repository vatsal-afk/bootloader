# Bootstrap Loader

To run this project: 
>( Windows Users need to set up a Virtual Machine or use WSL )

for debian based Linux users:
>just make sure that all the relative file structure remains intact

execute the following commands on the terminal: ( after navigating to the project dir )

```bash
sudo apt update
sudo apt install nasm qemu
```
you can find similar commands for macOS, redHat, etc.

```bash
chmod +x exec.sh
```

```bash
./exec.sh
```
this will assemble the boot.asm and kernel.asm files into binary files

The user is prompted with a boot menu with boot options :
1. Normal Mode
2. Recovery Mode

>fat12.asm contains header files for FAT 12 file system.

Basic error handling and debugging functionality has been implemented.

The kernel implementation is basic and the kernel prints on the emulator the message alongwith the selected boot option.

Note: This is a 16-bit real mode implementation though modern compilers do not support it. Implementaion of protected mode is expected in future updates.
Boot_mode stores the value correspinding to the selected boot_option.

This was the first time I was exposed to Assembly and these concepts of Operating Systems. Had fun implementing these features. Impatient to launch furthur updates.
Resources used: 
https://www.youtube.com/@nanobyte-dev
https://www.youtube.com/@olivestemlearning
https://www.tutorialspoint.com/assembly_programming/assembly_logical_instructions.htm
https://docs.oracle.com/cd/E19253-01/817-5477/817-5477.pdf
