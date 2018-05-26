include irvine32.inc
;//this doesnt want to work in a 64 bit project on my machine so I did the best I could with what I have
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
myArray DWORD 10d, 20d, 30d, 40d
finalArray DWORD 4 DUP(0)

.code
main PROC

mov ecx, 4
mov esi, 0
mov ebp, 4

L1:
; This writes myArray in the console window
	mov eax,0
	mov eax,esi
	mul ebp
	mov edi,eax
	mov eax,myArray[edi]
	inc esi
	call WriteInt

LOOP L1

call Crlf
mov ecx, 4
mov esi, 0
mov ebp, 4
L2:

; This copies the values from myArray into finalArray

mov eax, esi
mul ebp
mov edi, eax
mov eax, myArray[edi]


cmp esi, 4
je HandleLast

mov finalArray[edi + 1],eax
jmp EndLoop

HandleLast:
mov finalArray[0], edx

; I dont know how to print this in a way that shows
; properly, the array should work properly though.
; This swaps the elements in the array from [0, 1, 2, 3]
; to [3, 0, 1, 2]

EndLoop:
inc esi
; loop through array
; if not last position
; copy current value to finalArray[currentPosition + 1]
; if last position
; copy current value to finalArray[0]


LOOP L2
	call ExitProcess

main endp
end