section .text

extern puts
global print_string

print_string:
    push ebp
    mov ebp, esp
    push ebx                ; preserve ebx as required by cdecl

    ; TODO: print the string
    push dword[ebp + 8]
    call puts
    add esp, 4
    
    pop ebx
    leave
    ret
