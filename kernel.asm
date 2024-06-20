BITS 16
ORG 0x1000

start:
    ; Print a welcome message
    mov si, welcome_msg
    call print_string

    ; Determine boot mode from passed parameter
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

; Print string routine
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

welcome_msg db 'Kernel Loaded!', 0Dh, 0Ah, 0
normal_boot_msg db 'Normal Boot Mode', 0Dh, 0Ah, 0
recovery_mode_msg db 'Recovery Mode', 0Dh, 0Ah, 0

; Placeholder for boot mode
boot_mode db 0
