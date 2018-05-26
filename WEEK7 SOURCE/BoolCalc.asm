; Bool Calc
; Jacen Turner
; if using breakpoints this works
; cant figure out how to display total without ending program

INCLUDE Irvine32.inc

.data

caseTable BYTE '1'; lookup value
DWORD AND_Calc; address of procedure
EntrySize = ($ - caseTable)
BYTE '2'
DWORD OR_Calc
BYTE '3'
DWORD NOT_Calc
BYTE '4'
DWORD XOR_Calc
NumberOfEntries = ($ - caseTable) / EntrySize

msgMenu BYTE "Bool Calc", 0dh, 0ah
BYTE 0dh, 0ah
BYTE "1. x AND y", 0dh, 0ah
BYTE "2. x OR y", 0dh, 0ah
BYTE "3. NOT x", 0dh, 0ah
BYTE "4. x XOR y", 0


msgA BYTE "Bool AND", 0
msgB  BYTE "Bool OR", 0
msgC BYTE "Bool NOT", 0
msgD BYTE "Bool XOR", 0

msgInt1 BYTE "Please enter the first hexadecimal integer:  ", 0
msgInt2 BYTE "Please enter the second hexadecimal integer: ", 0
msgTotal   BYTE "The total is: ", 0


.code
main PROC
mov edx, OFFSET msgMenu
call WriteString
call ReadChar
call Crlf


mov ebx, OFFSET caseTable; choice from table
mov ecx, NumberOfEntries; loop counter

L1 :

	cmp al, [ebx]
	jne L2
	call NEAR PTR[ebx + 1]
	call Crlf
	jmp L3

	L2 :
	add ebx, EntrySize
	; point to the next entry
	loop L1
	; repeat until ECX = 0

	L3:	
		exit
	main ENDP


AND_Calc PROC


mov edx, OFFSET msgA; calc name
call WriteString; display message
call Crlf

mov edx, OFFSET msgInt1; 1st input
call WriteString
call ReadHex; get hex int
mov ebx, eax; mov to ebx

mov edx, OFFSET msgInt2; 2nd input
call WriteString
call ReadHex; get second hex int

and eax, ebx; int1 AND int2

mov edx, OFFSET msgTotal; result
call WriteString; display result
call WriteHex; display hex
call Crlf

ret

AND_Calc ENDP

OR_Calc PROC

mov edx, OFFSET msgB
call WriteString
call Crlf

mov edx, OFFSET msgInt1
call WriteString
call ReadHex
mov ebx, eax

mov edx, OFFSET msgInt2
call WriteString
call ReadHex

or eax, ebx; int1 or int2

mov edx, OFFSET msgTotal
call WriteString
call WriteHex
call Crlf

ret
OR_Calc ENDP

NOT_Calc PROC


mov edx, OFFSET msgC
call WriteString
call Crlf

mov edx, OFFSET msgInt1
call WriteString
call ReadHex

not eax

mov edx, OFFSET msgTotal
call WriteString
call WriteHex
call Crlf

ret

NOT_Calc ENDP

XOR_Calc PROC


mov edx, OFFSET msgD
call WriteString
call Crlf

mov edx, OFFSET msgInt1
call WriteString
call ReadHex
mov ebx, eax

mov edx, OFFSET msgInt2
call WriteString
call ReadHex

xor eax, ebx

mov edx, OFFSET msgTotal
call WriteString
call WriteHex
call Crlf

ret

XOR_Calc ENDP


	END main	