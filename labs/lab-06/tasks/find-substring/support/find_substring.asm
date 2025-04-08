; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

section .data
source_text: db "This is a test", 0 ; DO NOT MODIFY THIS LINE EXCEPT FOR THE STRING IN QUOTES
substring: db "for no occurrences", 0 ; DO NOT MODIFY THIS LINE EXCEPT FOR THE STRING IN QUOTES

print_format: db "Substring found at index: %d", 10, 0
substring_size dd 0
string_size dd 0
section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    xor ecx,ecx
    count_loop_substring:
        mov al, [substring + ecx]
        inc ecx
        test al,al
        jnz count_loop_substring
    mov dword[substring_size],ecx
    dec dword[substring_size]
    jz exit
    
    xor ecx,ecx
    count_loop_string:
        mov al, [source_text + ecx]
        inc ecx
        test al,al
        jnz count_loop_string
    mov dword[string_size], ecx
    dec dword[string_size]
    jz exit

    xor eax,eax
    jmp check_strings

    print_start:
        PRINTF32 `Substring found at index: %d\n\x0`,eax
        jmp check_exit
    check_strings:
        lea esi, [source_text + eax]
        lea edi, [substring]
        mov ecx, [substring_size]
        rep cmpsb
        jz print_start
    check_exit:
        inc eax
        cmp eax,[string_size]
        jl check_strings
    exit:
    leave
    ret
