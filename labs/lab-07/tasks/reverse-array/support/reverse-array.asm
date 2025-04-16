%include "printf32.asm"

%define ARRAY_LEN 7

section .data

input dd 122, 184, 199, 242, 263, 845, 911
output times ARRAY_LEN dd 0

section .text

extern printf
global main
main:

    ; TODO push the elements of the array on the stack

    mov ecx, ARRAY_LEN
    shl ecx, 2
    loop_copy:
        sub ecx, 4
        push dword[input + ecx]
        test ecx, ecx
        jnz loop_copy
        
    ; TODO retrieve the elements (pop) from the stack into the output array
    mov ecx, ARRAY_LEN
    shl ecx,2
    loop_retrieve:
        sub ecx, 4
        pop dword[output + ecx]
        test ecx, ecx
        jnz loop_retrieve

    PRINTF32 `Reversed array: \n\x0`
    xor ecx, ecx
print_array:
    mov edx, [output + 4 * ecx]
    PRINTF32 `%d\n\x0`, edx
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array

    xor eax, eax
    ret
