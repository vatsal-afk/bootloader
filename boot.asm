bits 16  ; Set processor mode to 16-bit (real mode)
org 0x7c00  ; Set origin point to 0x7C00 when BIOS loads your code

boot:
    mov ah, 0x02
    mov al, 0x01 ; 1 sector count reading one sector
    mov ch, 0x00
    mov cl, 0x02
    mov dh, 0x00
    mov dl, 0x00
    mov bx, 0x1000
    mov es, bx
    int 0x13
    jc disk_error
    mov ah, 0x0e
    mov al, "$"
    mov bh, 0
    int 0x10
    jmp 0x1000:0x00

disk_error:
    mov ah, 0x0e
    mov al, "!"
    mov bh, 0
    int 0x10
    hlt

mov si, 0  ; Initialize counter to print characters

print:
    mov ah, 0x0e  ; Function to print character in BIOS
    mov al, [hello + si]  ; Load character from hello string
    int 0x10  ; BIOS interrupt to print character
    add si, 1  ; Move to the next character
    cmp byte [hello + si], 0  ; Compare current character with null terminator
    jne print  ; Jump back to print if not end of string

jmp $  ; Infinite loop (halt)

hello:
    db "Hello, World!", 0  ; Null-terminated string

times 510 - ($ - $$) db 0  ; Fill remaining space with zeros
dw 0xAA55  ; Boot signature

