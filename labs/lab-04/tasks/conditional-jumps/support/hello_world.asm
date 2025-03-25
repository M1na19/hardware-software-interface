; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

section .data
    myString: db "Hello, World!", 0
    goodbyeString: db "Goodbye, World!", 0
    N: dd 6                         ; N = 6

section .text
    global main
    extern printf

main:
    mov ecx, DWORD [N]              ; ecx will store the value of N
    PRINTF32 `%d\n\x0`, ecx         ; DO NOT REMOVE/MODIFY THIS LINE

    mov eax, 2
    mov ebx, 1
    cmp eax, ebx
    jg print                        
    ret

print:
    start_loop:
        PRINTF32 `%s\n\x0`, myString
        dec ecx
        test ecx,ecx
        jnz start_loop 
                                    ; TODO2.2: print "Hello, World!" N times
    
    PRINTF32 `%s\n\x0`, goodbyeString
    ret
