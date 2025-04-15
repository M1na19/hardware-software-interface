%include "printf32.asm"

%define ARRAY_1_LEN 5
%define ARRAY_2_LEN 7
%define ARRAY_OUTPUT_LEN 12

section .data

array_1 dd 27, 46, 55, 83, 84
array_2 dd 1, 4, 21, 26, 59, 92, 105
array_output times 12 dd 0


section .text

extern printf
global main
main:
    mov ebp, esp

    mov ecx, ARRAY_1_LEN
    shl ecx, 2

    ; alloc array 1
    sub esp, ecx
    mov eax, esp
loop_copy_1:
    sub ecx, 4
    mov edx, [array_1+ ecx]
    mov dword[eax + ecx], edx
    test ecx,ecx
    jnz loop_copy_1


    mov ecx, ARRAY_2_LEN
    shl ecx, 2
    sub esp, ecx
    mov ebx, esp
loop_copy_2:
    sub ecx, 4
    mov edx, [array_2 + ecx]
    mov dword[ebx + ecx], edx
    test ecx,ecx
    jnz loop_copy_2    



    mov ecx, ARRAY_1_LEN
    shl ecx, 2
    sub ecx, 4
    add ecx, eax
    
    mov edx, ARRAY_2_LEN
    shl edx, 2
    sub edx, 4
    add edx, ebx
merge_arrays:
    mov esi, [ecx]
    mov edi, [edx]
    cmp esi, edi
    jg array_2_lower

array_1_lower:
    push edi
    sub edx, 4
    jmp verify_array_end
array_2_lower:
    push esi
    sub ecx, 4

verify_array_end:
   cmp ecx, eax
   jl copy_array_2
   
   cmp edx, ebx
   jge merge_arrays


copy_array_1:
   push dword[ecx]
   sub ecx, 4
   cmp ecx, eax
   jge copy_array_1
copy_array_2:
    push dword[edx]
    sub edx, 4
    cmp edx, ebx
    jge copy_array_2
    
print_array:
    PRINTF32 `Array merged:\n\x0`
print:
    mov ecx, ARRAY_OUTPUT_LEN
    print_loop:
        pop eax
        PRINTF32 `%d \x0`, eax
        loop print_loop
    
    PRINTF32 `\n\x0`
    mov esp, ebp
    xor eax, eax
    ret