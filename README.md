To run this project: 
( Windows Users need to set up a Virtual Machine or use WSL )
for debian based Linux users:

just make sure that all the relative file structure remains intact

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

fat12.asm contains header files for FAT 12 file system.

Basic error handling functionality has been implemented.
