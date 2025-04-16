%include "printf32.asm"

%define NUM 5

section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO 1: replace every "push" instruction by an equivalent sequence of commands (use direct addressing of memory. Hint: esp)
    mov ecx, NUM
push_nums:
    sub esp, 4
    mov dword[esp], ecx
    loop push_nums

sub esp, 4
mov dword[esp], 0
sub esp, 4
mov dword[esp], "corn"
sub esp, 4
mov dword[esp], "has "
sub esp, 4
mov dword[esp], "Bob "

lea esi, [esp]
PRINTF32 `%s\n\x0`, esi

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    mov eax, ebp
print_stack:
    PRINTF32 `0x%x: 0x%x\n\x0`, eax, [eax]
    sub eax, 4
    cmp eax, esp
    jge print_stack

    ; use PRINTF32 macro - see format above

    ; TODO 3: print the string
xor edx, edx
print_string:
    mov dl, byte[esp]
    PRINTF32 `%c\x0`, edx
    inc esp
    cmp byte[esp], 0
    jnz print_string

PRINTF32 `\n\x0`
    ; TODO 4: print the array on the stack, element by element.

mov ecx, NUM
print_array:
    add esp, 4
    mov eax, [esp]
    PRINTF32 `%d \x0`, eax
    loop print_array
PRINTF32 `\n\x0`


    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp


    ; exit without errors
    xor eax, eax
    ret
