; Practice 3

DGROUP GROUP _DATA, _BSS ; Data segments are grouped

_DATA SEGMENT WORD PUBLIC 'DATA' ; Public data segment
_DATA ENDS

_BSS SEGMENT WORD PUBLIC 'BSS' ; Public data segment
_BSS ENDS


_TEXT SEGMENT BYTE PUBLIC 'CODE' ; Definition of the code segment
    ASSUME CS:_TEXT, DS:DGROUP

;PUBLIC _OddPositive ; Make function accessible from C

;_OddPositive PROC FAR ; int OddPositive(int num)
;    PUSH BP ; For using BP in order to address the stack,
;    MOV BP, SP ; it is loaded with pointer to the top
;     
;    mov ax, [bp + 6]
;    cmp ax, 0
;    jle negative
;        and ax, 1 
;        jmp end_odd_positive
;    negative:
;        xor ax, ax 
;    end_odd_positive:
;    POP BP ; Restore BP
;    RET ; Return to calling procedure
;_OddPositive ENDP


_TEXT ENDS
END