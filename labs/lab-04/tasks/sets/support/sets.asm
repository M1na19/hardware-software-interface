; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

section .data
    FIRST_SET: dd 139   ; The first set
    SECOND_SET: dd 169  ; The second set

section .text
    global main
    extern printf

main:
    ; The two sets can be found in the FIRST_SET and SECOND_SET variables
    mov eax, DWORD [FIRST_SET]
    mov ebx, DWORD [SECOND_SET]
    PRINTF32 `%u\n\x0`, eax ; print the first set
    PRINTF32 `%u\n\x0`, ebx ; print the second set
    
    mov edx,ebx
    ; TODO1: reunion of the two sets
    or eax,ebx
    PRINTF32 `%u\n\x0`, eax ; print the first set

    ; TODO2: adding an element to a set
    or eax,256
    PRINTF32 `%u\n\x0`, eax ; print the first set

    ; TODO3: intersection of the two sets
    and ebx,eax
    PRINTF32 `%u\n\x0`, ebx ; print the first set

    ; TODO4: the complement of a set
    mov ebx,eax
    not ebx
    PRINTF32 `%u\n\x0`, ebx ; print the first set

    ; TODO5: removal of an element from a set
    mov ecx,1
    not ecx
    and ecx,eax
    PRINTF32 `%u\n\x0`, ecx ; print the first set

    ; TODO6: difference of two sets
    xor eax,edx
    PRINTF32 `%u\n\x0`, eax ; print the first set

    xor eax, eax
    ret
