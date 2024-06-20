BITS 16
ORG 0x1000

start:
    mov si, entry_msg
    call print_string

    cmp byte [boot_mode], 1
    je normal_boot
    cmp byte [boot_mode], 2
    je recovery_mode

normal_boot:
    mov si, normal_boot_msg
    call print_string
    jmp halt

recovery_mode:
    mov si, recovery_mode_msg
    call print_string
    jmp halt

halt:
    hlt
    jmp halt

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

entry_msg db 'Kernel Loaded!', 0Dh, 0Ah, 0
normal_boot_msg db 'Normal Boot Mode', 0Dh, 0Ah, 0
recovery_mode_msg db 'Recovery Mode', 0Dh, 0Ah, 0

boot_mode db 0
