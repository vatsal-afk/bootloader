BITS 16 
ORG 0x7C00

cli
xor ax, ax
mov ss, ax
mov sp, 0x7C00
sti

boot_menu:
    mov si, boot_menu_msg
    call print_string

    call get_key
    cmp al, '1'
    je normal_boot
    cmp al, '2'
    je recovery_mode
    jmp boot_menu  ; Invalid input, show menu again

normal_boot:
    mov si, normal_boot_msg
    call print_string
    mov byte [boot_mode], 1
    jmp load_kernel

recovery_mode:
    mov si, recovery_mode_msg
    call print_string
    mov byte [boot_mode], 2
    jmp load_kernel

load_kernel:
    ; Assuming the kernel is loaded at 0x1000
    mov ax, 0x1000
    mov es, ax
    xor bx, bx
    mov ah, 02h
    mov al, 3    ; Number of sectors to read
    mov ch, 0
    mov cl, 2    ; Starting at sector 2
    mov dh, 0
    int 13h

    jmp 0x1000:0000

print_string:
    mov ah, 0Eh
.print_loop:
    lodsb
    cmp al, 0
    je .done
    int 10h
    jmp .print_loop
.done:
    ret

; Get key input routine
get_key:
    mov ah, 0
    int 16h
    ret

boot_menu_msg db 'Boot Menu:', 0Dh, 0Ah
               db '1. Normal Boot', 0Dh, 0Ah
               db '2. Recovery Mode', 0Dh, 0Ah
               db 'Select an option: ', 0
normal_boot_msg db 'Normal Boot Selected', 0Dh, 0Ah, 0
recovery_mode_msg db 'Recovery Mode Selected', 0Dh, 0Ah, 0

boot_mode db 0

TIMES 510-($-$$) DB 0
DW 0xAA55
