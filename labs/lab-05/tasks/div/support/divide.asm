; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

; https://en.wikibooks.org/wiki/X86_Assembly/Arithmetic

section .data
    dividend1 db 91
    divisor1 db 27
    dividend2 dd 67254
    divisor2 dw 1349
    dividend3 dq 69094148
    divisor3 dd 87621

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    xor eax, eax

    mov al, byte [dividend1]
    mov bl, byte [divisor1]
    div bl

    xor ebx, ebx
    mov bl, al
    PRINTF32 `Quotient: %hhu\n\x0`, ebx

    xor ebx, ebx
    mov bl, ah
    PRINTF32 `Remainder: %hhu\n\x0`, ebx


    ; TODO: Calculate quotient and remainder for 67254 / 1349.
    xor eax, eax
    mov edx, edx
    mov dx, word [dividend2+2]
    mov ax, word [dividend2]
    mov bx, word [divisor2]
    div bx

    PRINTF32 `Quotient: %hu\n\x0`, eax
    PRINTF32 `Remainder: %hu\n\x0`, edx


    ; TODO: Calculate quotient and remainder for 69094148 / 87621.
    mov eax, dword [dividend3]
    mov edx, dword [dividend3 + 4]
    mov ebx, dword [divisor3]
    div ebx

    PRINTF32 `Quotient: %d\n\x0`, eax
    PRINTF32 `Remainder: %d\n\x0`, edx
    leave
    ret
