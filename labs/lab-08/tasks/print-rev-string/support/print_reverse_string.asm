section .bss
	store_string resb 64
section .text
extern printf
extern puts
global print_reverse_string

reverse_string:
    push ebp
    mov ebp, esp
    push ebx                ; preserve ebx as required by cdecl

    mov eax, [ebp + 8]
    mov ecx, [ebp + 12]
    add eax, ecx
    dec eax
    mov edx, [ebp + 16]

copy_one_byte:
    mov bl, [eax]
    mov [edx], bl
    dec eax
    inc edx
    loopnz copy_one_byte

    inc edx
    mov byte [edx], 0

    pop ebx                 ; restore ebx
    leave
    ret

print_reverse_string:
	push ebp
	mov ebp, esp
	push ebx                ; preserve ebx as required by cdecl


	push store_string
	push dword[ebp+12]
	push dword[ebp+8]
	call reverse_string
	add esp, 12
	
	push store_string
	call puts
	add esp, 4

	pop ebx
	leave
	ret
