INTERR_ADDR EQU 57h
ROW_LEN EQU 6 

code SEGMENT
    ASSUME cs:code 

    ORG 256 
    start: 
        cmp word ptr cs:[82h], "/I"
        je installer 
        cmp word ptr cs:[82h], "/D"
        je uninstaller
    
        start_end:
        mov ax, 4C00h
        int 21h 

    ; variables
    POLYBIUS DB "Driver$"

    isr PROC FAR
        push ax bx cx dx
        
        mov bx, dx 
        mov cx, ROW_LEN

        cmp ah, 10h
        je codification 
        ; decodification 
        cmp byte ptr [bx], '$'
        je end_isr 
            decodification_loop:
                mov dx, [bx]
                dec dl 
                dec dh 
                mov al, dh 
                mul cl     
                add al, dl 
                cmp al, 'Z'-'A'
                jg decodification_number 
                ; letter 
                    add al, 'A'
                    jmp decodification_print
                decodification_number:
                    sub al, 'z'-'a'+1-'0'
                decodification_print:
                    call print_char            
                cmp byte ptr [bx+2], '$'
                je end_isr
                add bx, 3
                jmp decodification_loop            

        codification:
            codification_loop:
                mov al, [bx]
                cmp al, '$'
                je end_isr
                cmp 'A', al
                jbe codification_letter 
                    ; it is a number 
                    add al, 'z'-'a'+1-'0'
                    jmp codification_operation
                codification_letter:
                    sub al, 'A'    
                codification_operation:
                    mov ah, 0 
                    div cx ; ax /= 6
                    add al, 1-'0'
                    call print_char  
                    dec ah, 1-'0'
                    mov al, ah 
                    call print_char
                    mov al, ' '
                    call print_char
                    inc bx 
                    jmp codification_loop

        end_isr:
        
        mov al, 13 
        print_char
        mov al, 10 
        print_char 

        pop dx cx bx ax 
        iret 
    ist ENDP 

    ; prints char in al 
    print_char PROC 
        push ax dx
        mov dl, al 
        mov ah, 2h 
        int 21h
        pop dx ax 
        ret 
    print_char ENDP 

    uninstaller PROC 
        push ax bx cx ds es
        mov cx, 0
        mov ds, cx ; Segment of interrupt vectors
        mov es, ds:[ INTERR_ADDR*4+2 ] ; Read ISR segment
        mov bx, es:[ 2Ch ] ; Read segment of environment from ISR’s PSP. mov ah, 49h
        int 21h ; Release ISR segment (es)
        mov es, bx
        int 21h ; Release segment of environment variables of ISR; Set vector of interrupt 40h to zero
        cli
        mov ds:[ INTERR_ADDR*4 ], cx ; cx = 0
        mov ds:[ INTERR_ADDR*4+2 ], cx
        sti
        pop es ds cx bx ax
        ret
    uninstaller ENDP 

    installer PROC
        mov ax, 0 
        mov es, ax 
        mov ax, OFFSET isr 
        mov bx, cs 

        cli 
        mov es:[INTERR_ADDR*4], ax 
        mov es:[INTERR_ADDR*4+2], bx
        sti 
        mov dx, OFFSET installer  
        int 27h 
    installer ENDP 

code ENDS 
END start 