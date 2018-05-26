; String Reverse at location &target
;CHAPTER 4 & 5 PROGRAM ASSIGNMENT

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

source BYTE "This is a string",0
target BYTE SIZEOF source DUP('#')

.code
main PROC

; initialize pointer to the first character of target
MOV esi,0
; initialize ecx SIZEOF source
MOV ecx,SIZEOF source

mov al, 0

; start loop
L1 :

; copy current character in source to current character in target
mov al,source[ecx - 1]
MOV[target + esi], al

; mov that character to current character in target
MOV[target + esi], al
; increment target pointer
INC esi
;end loop
LOOP L1

call ExitProcess
main endp
end main