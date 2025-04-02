; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

%define ARRAY_SIZE    10

section .data
    dword_array dd 1392, -12544, -7992, -6992, 7202, 27187, 28789, -17897, 12988, 17992
    positive dd 0
    negative dd 0
    mask dd 0x80000000
section .text
extern printf
global main
main:
	; TODO: Implement the code to count negative and positive numbers in the array
    mov ecx, ARRAY_SIZE

count:
    mov eax, dword[dword_array + 4*(ecx-1)]
    and eax, dword[mask]
    test eax,eax
    jnz found_neg
    inc dword[positive]
    loop count
    PRINTF32 `Num pos is %u, num neg is %u\n\x0`, [positive], [negative]
    ret
found_neg:
    inc dword[negative]
    loop count
