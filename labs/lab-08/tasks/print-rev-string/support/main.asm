section .data
    mystring db "This is my string", 0
    fmt_str db "[before]: %s",10,"[after]: ", 0; Aici nu imi arata bine

section .text

extern printf
extern print_reverse_string
global main

main:
    push ebp
    mov ebp, esp

    mov eax, mystring
    xor ecx, ecx
test_one_byte:
    mov bl, [eax]
    test bl, bl
    je out
    inc eax
    inc ecx
    jmp test_one_byte

out:
    mov ebx, ecx; Am adaugat linia asta pentru ca printf imi sterge informatia din ecx
    push mystring
    push fmt_str
    call printf
    add esp, 8

    push ebx
    push mystring
    call print_reverse_string
    add esp, 8

    leave
    ret
