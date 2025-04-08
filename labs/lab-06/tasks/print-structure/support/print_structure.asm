; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

struc stud_struct
    name: resb 32
    surname: resb 32
    age: resb 1
    group: resb 8
    gender: resb 1
    birth_year: resw 1
endstruc

section .data
sample_student:
    istruc stud_struct
        at name, db 'Andrei', 0
        at surname, db 'Voinea', 0
        at age, db 21
        at group, db '321CA', 0
        at gender, db 1
        at birth_year, dw 1994
    iend

new_group db "323CA",0
format_name db "Name: %s", 10, 0
format_surname db "Surname: %s", 10, 0
format_age db "Age: %d", 10, 0
format_group db "Group: %s", 10, 0
format_gender db "Gender: %d", 10, 0
format_year db "Birth year: %d", 10, 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    ; TODO: Update name, surname, birth_year, gender and age such that:
    ; birth_year is 1993
    lea ebx,[sample_student + birth_year]
    mov dword[ebx], 1993
    ; age is 22
    lea ebx,[sample_student + age]
    mov word[ebx], 22
    ; group is '323CA'
    lea ebx,[sample_student + group]
    mov edx, [new_group]
    mov dword[ebx], edx
    mov edx, [new_group+4]
    mov dword[ebx+4],edx

    lea eax, [sample_student + name]
    push eax
    push format_name
    call printf
    add esp, 8

    lea eax, [sample_student + surname]
    push eax
    push format_surname
    call printf
    add esp, 8

    movzx eax, byte [sample_student + age]
    push eax
    push format_age
    call printf
    add esp, 8

    lea eax, [sample_student + group]
    push eax
    push format_group
    call printf
    add esp, 8

    movzx eax, byte [sample_student + gender]
    push eax
    push format_gender
    call printf
    add esp, 8

    movzx eax, word [sample_student + birth_year]
    push eax
    push format_year
    call printf
    add esp, 8

    leave
    ret
