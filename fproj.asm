%include "simple_io.inc"
global asm_main
extern rperm

section .data
    prompt1: db "if you want to swap, enter a,b",10,0
    prompt2: db "if you want to end, enter 0: ",0
	printMes1: db "Swapping box ",0
	printMes2: db " with box ",0
    errorMessage1: db "You did not enter anything, try again.",10,0
    errorMessage2: db "Your input was invalid, try again.",10,0
    errorMessage3: db "Your second coordinate is empty, try again.",10,0
    programEndMes: db "Program Finished",10,0 
    bot8: db "..+------+",0
    bot7: db "..+-----+.",0
    bot6: db "...+----+.",0
    bot5: db "...+---+..",0
    bot4: db "....+--+..",0
    bot3: db "....+-+...",0
    bot2: db ".....++...",0
    bot1: db ".....+....",0
    mid8: db "  +      +",0
    mid7: db "  +     + ",0
    mid6: db "   +    + ",0
    mid5: db "   +   +  ",0
    mid4: db "    +  +  ",0
    mid3: db "    + +   ",0
    mid2: db "     ++   ",0
    mid1: db "      +   ",0
    top8: db "  +------+",0
    top7: db "  +-----+ ",0
    top6: db "   +----+ ",0
    top5: db "   +---+  ",0
    top4: db "    +--+  ",0
    top3: db "    +-+   ",0
    top2: db "     ++   ",0
    top1: db "      +   ",0
    numLeft: db "     ",0
    numRight: db "    ",0
    blankSpaces: db "          ",0
section .bss
	array: resq 8


section .text


display:
    enter 0,0
    saveregs
   
    mov r13, [rbp+24] ;; array
    mov r12, [rbp+32] ;; size
   
    add r12, 1 ;;adding 1 to the size because using 'loop' stops loop at counter = 1 not 0
    mov rcx, r12   ;this is loop counter for the levels starting at 9 ending at 1
        printLine:
            ;moving counter to r14 and decreasing it by 1 so we have the right level
            mov r14, rcx 
            sub r14, 1
            push r14 ;;level
            push r13 ;;aray
            sub rsp, 8 ;;adjusting
            call createLine
            add rsp, 8
            pop r13
            pop r14

            call print_nl

            loop printLine

    restoregs
    leave
    ret

;add2line is used to print the line segments specified above
add2line:
    enter 0,0
    saveregs


    mov r15, qword [rbp+24]  ;level
    mov r14, qword [rbp+32]  ;size (array)
    
 
    ;now we want our first if statement from 
    ;if level == 1
    cmp r15, 1
    je cond1

    ;;if level is greater than 1
    cmp r15, 1
    jg cond2
        
    ;; if level = 0 we have to print the numbers at the bottom
    cmp r15, 0
    je cond3

    jmp add2lineEnd     


add2lineEnd:
    restoregs
    leave
    ret


cond1:
    ;if size = 8
    cmp r14, 8
    je b8

    ;if size = 7
    cmp r14, 7
    je b7
             
    ;if size = 6
    cmp r14, 6
    je b6

    ;if size = 5
    cmp r14, 5
    je b5

    ;if size = 4
    cmp r14, 4
    je b4

    ;if size = 3
    cmp r14, 3
    je b3

    ;if size = 2
    cmp r14, 2
    je b2

    ;if size = 1
    cmp r14, 1
    je b1

    jmp add2lineEnd

b8:
    mov rax, bot8 ;put string
    call print_string
    jmp add2lineEnd

b7:
    mov rax, bot7 ;put string
    call print_string        
    jmp add2lineEnd       
b6:
    mov rax, bot6 ;put string
    call print_string
    jmp add2lineEnd 
b5:
    mov rax, bot5 ;put string
    call print_string
    jmp add2lineEnd 
b4:
    mov rax, bot4 ;put string
    call print_string
    jmp add2lineEnd 
b3:
    mov rax, bot3 ;put string
    call print_string
    jmp add2lineEnd 
b2:
    mov rax, bot2 ;put string
    call print_string
    jmp add2lineEnd 
b1:
    mov rax, bot1 ;put string
    call print_string
    jmp add2lineEnd 

;;level greater than 1
cond2: 
    ;;if size is less than level 
    cmp r14, r15 
    jl spaces

    ;;If the size and level are equal
    cmp r14, r15
    je topLines

    cmp r14, r15 
    jg midLines

    jmp add2lineEnd

spaces:
    mov rax, blankSpaces
    call print_string
    jmp add2lineEnd 

topLines:
    ;;if size is 8,7,6,5,4,3,2,1
    cmp r14, 8
    je t8

    cmp r14, 7
    je tt7

    cmp r14, 6
    je tt6

    cmp r14, 5
    je t5

    cmp r14, 4
    je t4

    cmp r14, 3
    je t3

    cmp r14, 2
    je t2

    cmp r14, 1
    je t1

    jmp add2lineEnd

t8:
    mov rax, top8
    call print_string
    jmp add2lineEnd 
tt7:
    mov rax, top7
    call print_string
    jmp add2lineEnd 
tt6:
    mov rax, top6
    call print_string
    jmp add2lineEnd        
t5:
    mov rax, top5
    call print_string
    jmp add2lineEnd      
t4:
    mov rax, top4
    call print_string
    jmp add2lineEnd 
t3:
    mov rax, top3
    call print_string
    jmp add2lineEnd 
t2:
    mov rax, top2
    call print_string
    jmp add2lineEnd 
t1:
    mov rax, top1
    call print_string
    jmp add2lineEnd 

midLines:    
    cmp r14,8
    je m8 

    cmp r14,7
    je m7 

    cmp r14,6
    je m6 

    cmp r14,5
    je m5

    cmp r14,4
    je m4 

    cmp r14,3
    je m3

    cmp r14,2
    je m2 

    cmp r14,1
    je m1 
    jmp add2lineEnd 


m8:
    mov rax, mid8
    call print_string
    jmp add2lineEnd 
m7:
    mov rax, mid7
    call print_string
    jmp add2lineEnd 
m6:
    mov rax, mid6
    call print_string
    jmp add2lineEnd 
m5:
    mov rax, mid5
    call print_string
    jmp add2lineEnd 
m4:
    mov rax, mid4
    call print_string
    jmp add2lineEnd 
m3:
    mov rax, mid3
    call print_string
    jmp add2lineEnd 
m2:
    mov rax, mid2
    call print_string
    jmp add2lineEnd 
m1:
    mov rax, mid1
    call print_string
    jmp add2lineEnd 

cond3:

    mov rax, numLeft
    call print_string
    mov rax, r14
    call print_int 
    mov rax, numRight
    call print_string                    
    jmp add2lineEnd     


createLine:
    enter 0,0 
    saveregs

    mov rdx, [rbp+24] ;;array
    mov r12, [rbp+32] ;;level

    mov r13, qword 0 ;;counter 0 to 7 (56 because we multiply by 8) (so the indicides of the array)
    myLoop1:
        cmp r13, qword 56
        ja endLoop

        mov r14, rdx
        add r14, qword r13
        mov r15, [r14]
    

        push r15           ;;pushing the array[i]
        push r12             ;;pushing the level
        sub rsp, 8           ;;aligning

        call add2line

        add rsp, 8          ;;celaning up 
        pop r12
        pop r15

        add r13, qword 8              ;;increasing counter 
        jmp myLoop1
    endLoop:

    restoregs
    leave
    ret

asm_main:
    enter 0,0
    saveregs

	mov	rdi, array     ;1st param for rperm
	mov	rsi, qword 8   ;2nd param for rperm
	call rperm
    
    ;labal used to call display again
    printLabel:

    push 8
    push array
    sub rsp, 8
    call display
    add rsp, 24



prompt:
    mov     rax, prompt1
    call    print_string
    mov     rax, prompt2
    call    print_string


read:
    call    read_char       ;;reading the input
    cmp     al, '0'         ;;checking if its a 0  
    jne     byPass

	;;printing error messaage and endind program
    mov     rax, programEndMes
    call    print_string 
    jmp     asm_main_end    ;;if it is then jump to end

    byPass:

    ;;check if nothing entered
    cmp     al, 10
    je      error1

    ;;reading for first char, checkign for error less than 1 or greater than 8
    cmp     al, '1' 
    jb      error2 
    cmp     al, '8'
    ja      error2

    ;;reading and storing first character in r12b
    mov     r12, 0
    mov     r12b, al
    sub     r12b, '0'

    ;;checking if its a comma, if it isn't jump to the error message
    call    read_char
    cmp     al,10
    je      error4
    cmp     al, ','
    jne     error2     

    call    read_char
    ;;checking if second coordinate empty
    cmp     al, 10
    je      error3

    ;;checking if its less than one, greater than 8 or if the user wants to end the code 
    je      asm_main_end
    cmp     al, '1'
    jb      error2
    cmp     al, '8'
    ja      error2

    ;;storing the second character into r13b
    mov     r13, 0
    mov     r13b, al
    sub     r13b, '0'
       
    ;;checking if both characters same
    cmp r12b,r13b
    je error2
    
	;;Printing Swapping message
    mov rax, printMes1
    call print_string
    mov rax, r12
    call print_int
    mov rax, printMes2
    call print_string
    mov rax, r13
    call print_int
    call print_nl

    ;;storing the array in the r14 register
    mov     r14, array
    
;;loops are used for swapping values     
LOOP1:
    cmp     [r14], r12
    je      LOOP2
    add     r14, 8
    jmp     LOOP1

LOOP2:
    mov     r15, array
LOOP3:
    cmp     [r15], r13
    je      LOOP4
    add     r15, 8
    jmp     LOOP3



LOOP4:
    mov     [r14], r13
    mov     [r15], r12
    jmp L1

error1:
    mov     rax, errorMessage1
    call    print_string
    jmp     L2

error2:
    mov     rax, errorMessage2
    call    print_string
    jmp     L1

error3:
    mov     rax, errorMessage3
    call    print_string
    jmp     L2
error4:
    mov     rax,errorMessage2
    call    print_string
    jmp     L2

L1:
    cmp     al, 10
    je      L2
    call    read_char
    jmp     L1   
L2:
    jmp     printLabel

asm_main_end:
    restoregs
    leave
    ret