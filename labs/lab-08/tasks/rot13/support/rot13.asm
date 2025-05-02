%include "printf32.asm"
section .text
global rot13
extern printf

rot13:
    push ebp
    mov ebp, esp
    push ebx                ; preserve ebx as required by cdecl
    
    mov eax, [ebp + 8]
    mov ecx, [ebp + 12]
    dec ecx ; igonre last \0
    xor edx, edx
    loop_start:
        
        mov dl, [eax + ecx - 1] 

        ; if character is \0
        test dl, dl
        je is_zero

        ; test if character is over the limit that it has to loop back
        jmp test_loop_back
        no_loop_back:

        add dl, 13
        mov byte[eax + ecx -1], dl
        loop loop_start

    jmp exit
    test_loop_back:
        cmp dl, 91
        jl upper_case
    lower_case:
        cmp dl, 109
        jle no_loop_back

        mov dh, 122 
        sub dh,dl
        xchg dh,dl
        mov dh, 13
        sub dh, dl
        xchg dh,dl
        add dl, 96       

        mov byte[eax + ecx - 1], dl
        loop loop_start

    jmp exit
    upper_case:
        cmp dl, 77
        jle no_loop_back

        mov dh, 90 
        sub dh,dl
        xchg dh,dl
        mov dh, 13
        sub dh, dl
        xchg dh,dl
        add dl, 64       

        mov byte[eax + ecx - 1], dl
        loop loop_start

    jmp exit
    is_zero:
        mov byte[eax + ecx - 1], 32
        loop loop_start
    exit:
    pop ebx
    leave
    ret
