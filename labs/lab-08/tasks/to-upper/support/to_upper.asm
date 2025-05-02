section .text

global to_upper

to_upper:
    push ebp
    mov ebp, esp
    push ebx                ; preserve ebx as required by cdecl

    mov eax, [ebp+8] ; mystring
    xor ecx,ecx
    loop_upper:
        mov dl, byte[eax+ecx]
        test dl, dl
        jz exit
        sub dl, 32
        mov byte[eax+ecx],dl
        inc ecx
        jmp loop_upper
    exit:
    pop ebx
    leave
    ret
