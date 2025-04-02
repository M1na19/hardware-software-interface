; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

%define ARRAY_SIZE    10

section .data
    dword_array dd 1392, 12544, 7991, 6992, 7202, 27187, 28789, 17897, 12988, 17992
    odd dd 0
    even dd 0
section .text
extern printf
global main
main:
    mov ecx, ARRAY_SIZE

count:
    mov eax, dword[dword_array + 4 * (ecx -1)]
    and eax, 1
    test eax, eax
    jnz found_odd
    inc dword[even]
    loop count
    PRINTF32 `Num even is %u, num odd is %u\n\x0`, [even], [odd]
    ret
found_odd:
    inc dword[odd]
    loop count
    