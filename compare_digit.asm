section .data
    prompt db "Enter a digit (0-9): ", 0
    below_msg db "The digit is below 5", 10, 0
    equal_msg db "The digit is equal to 5", 10, 0
    above_msg db "The digit is above 5", 10, 0

section .bss
    input resb 2

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 22
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 2
    int 0x80

    movzx eax, byte [input]
    sub eax, '0'

    call compare_digit

    mov eax, 1
    xor ebx, ebx
    int 0x80

compare_digit:
    cmp eax, 5
    jl below
    je equal
    jg above

below:
    mov eax, 4
    mov ebx, 1
    mov ecx, below_msg
    mov edx, 23
    int 0x80
    ret

equal:
    mov eax, 4
    mov ebx, 1
    mov ecx, equal_msg
    mov edx, 24
    int 0x80
    ret

above:
    mov eax, 4
    mov ebx, 1
    mov ecx, above_msg
    mov edx, 23
    int 0x80
    ret
