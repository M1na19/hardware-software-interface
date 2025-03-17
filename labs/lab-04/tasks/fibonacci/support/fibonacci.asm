; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

section .data
    N: dd 5          ; N-th fibonacci number to calculate

section .text
    global main
    extern printf

main:
    mov eax, DWORD [N]       ; we want to find the N-th fibonacci number; N = ECX = 7
    cmp eax , 2
    jle base
    sub eax,2

    mov ebx,1
    mov ecx,1
    start_loop:
        add ebx,ecx
        xor ecx, ebx
        xor ebx, ecx
        xor ecx, ebx

        dec eax
        test eax,eax
        jne start_loop
    print:
        PRINTF32 `%d\n\x0`, ecx  ; DO NOT REMOVE/MODIFY THIS LINE
    ret
base:
    mov ecx,1
    jmp print