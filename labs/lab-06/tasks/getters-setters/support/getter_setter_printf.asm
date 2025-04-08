; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

struc my_struct
    int_x: resb 4
    char_y: resb 1
    string_s: resb 32
endstruc

section .data
    sample_obj:
        istruc my_struct
            at int_x, dd 1000
            at char_y, db 'a'
            at string_s, db 'My string is better than yours', 0
        iend

    new_int dd 2000
    new_char db 'b'
    new_string db 'Are you sure?', 0

section .text
extern printf
global main

main:
    push ebp
    mov ebp, esp

    ; Print all three values (int_x, char_y, string_s) from sample_obj.
    ; Hint: use "lea reg, [base + offset]" to save the result of
    ; "base + offset" into register "reg".
    lea eax, [sample_obj + int_x]
    lea ebx, [sample_obj + char_y]
    lea ecx, [sample_obj + string_s]
    PRINTF32 `int_x: %d\nchar_y: %c\nstring_s: %s\n\x0`, [eax],[ebx],ecx

    ; TODO: write the equivalent of "sample_obj->int_x = new_int".
    mov edx, [new_int]
    mov dword[eax], edx
    ; TODO: write the equivalent of "sample_obj->char_y = new_char".
    mov dl, byte[new_char]
    mov byte[ebx], dl
    ; TODO: write the equivalent of "strcpy(sample_obj->string_s, new_string)".
    mov esi, new_string
    mov edi, ecx
    mov ecx, 14
    rep movsb
    ; TODO: print all three values again to validate the results of the
    ; three set operations above.
    lea eax, [sample_obj + int_x]
    lea ebx, [sample_obj + char_y]
    lea ecx, [sample_obj + string_s]
    PRINTF32 `int_x: %d\nchar_y: %c\nstring_s: %s\n\x0`, [eax],[ebx],ecx
    xor eax, eax
    leave
    ret
