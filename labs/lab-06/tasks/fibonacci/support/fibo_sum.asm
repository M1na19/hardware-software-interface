; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

section .data
    N dd 1 ; DO NOT MOFIDY THIS LINE EXCEPT FOR THE VALUE OF N!
           ; compute the sum of the first N fibonacci numbers
    last dd 1
    sum_print_format db "Sum first %d fibonacci numbers is %d", 10, 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    ; TODO: calculate the sum of first N fibonacci numbers
    ;       (f(0) = 0, f(1) = 1)
    xor eax,eax

    ; Use the loop instruction
    cmp dword[N],1
    jle end_loop

    mov ecx, [N]
    sub ecx,1

    mov edx, 0
    loop_start:
        add eax, [last]
        add edx, [last]
        xchg edx,[last]
        loop loop_start
    end_loop:
    push eax
    push dword [N]
    push sum_print_format
    call printf
    add esp, 12

    xor eax, eax
    leave
    ret
