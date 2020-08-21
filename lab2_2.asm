.686p
.model flat, stdcall
option casemap: none
ExitProcess PROTO STDCALL :DWORD
MessageBoxA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD
wsprintfA PROTO C :VARARG
.data
TitleMsg db 'Œ“¬≈“',0
buffer db 128 dup(0)
format db '(%d - %d) * %d * ((%d + %d) / (%d + %d)) * (%d / %d) = %d', 0
mem1 dd 145
mem2 dd 125
mem3 dd 2
mem4 dd 945
mem5 dd 275
mem6 dd 555
mem7 dd 55
mem8 dd 8
mem9 dd 2
mem10 dd ?
mem11 dd ?
mem12 dd ?
mem13 dd ?
.code
program:
mov eax, mem4
add eax, mem5
mov mem10, eax ;1220
mov eax, mem6
add eax, mem7       
mov mem11, eax          ;610
mov eax, mem10     
cdq
mov ebx, mem11
idiv ebx
mov  mem12,eax     ;2
mov eax, mem8
cdq
mov ebx, mem9
idiv ebx      
mov mem13 ,eax       ;4
mov eax, mem1
sub eax, mem2          ;20
mov ebx, mem3           ;2
imul ebx                ;eax = 40

mov ebx, mem12
imul ebx        ;eax = 80
mov ebx, mem13   ;80*4 = 320
imul ebx         ;eax = 320


invoke wsprintfA, addr buffer, addr format, mem1, mem2, mem3, mem4, mem5, mem6, mem7,mem8 , mem9, eax
invoke MessageBoxA, 0, ADDR buffer, ADDR TitleMsg,0
invoke ExitProcess,0
end program