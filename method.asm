%include "simple_io.inc"

global asm_main
extern rperm

section .data

    countDown: dq 8,7,6,5,4,3,2,1,0
    err1: db "incorrect number of command line arguments",10,0
    err2: db "incorrect length of the argument",10,0
    err3: db "inccorect first letter of the argument (should be an upper case letter)",10,0
    err4: db "inccorect second letter of the argument (should be 3 or 5 or 7 or 9)",10,0
    mes1: db "param1 is: ",10,0
    mes2: db "parm2 is: ",10,0
    mes3: db "param3 is: ",10,0

section .bss

section .text

display:
    enter 0,0
    saveregs

    mov rax, mes1
    call print_string
    mov rax, [rbp+16]
    call print_int
    call print_nl

    mov rax, mes2
    call print_string
    mov rax, [rbp +24]
    call print_int
    call print_nl

    mov rax, mes3
    call print_string
    mov rax, [rbp + 32]
    call print_int
    call print_nl


    restoregs
    leave
    ret 

asm_main:
    enter 0,0
    saveregs

    push qword 1
    push qword 2
    push qword 3
    call display
    add rsp,24

    restoregs
    leave
    ret
