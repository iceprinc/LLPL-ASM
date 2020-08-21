.686p
.model flat, stdcall
option casemap: none
ExitProcess PROTO STDCALL :DWORD
MessageBoxA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD
wsprintfA PROTO C :VARARG
.data
TitleMsg db '–≈ÿ≈Õ»≈',0
buffer db 128 dup(0)
format db '%d * ( %d + %d - %d / %d ) - %d + %d = %d', 0
mem1 dd 14
mem2 dd 3
mem3 dd 152
mem4 dd 1500
mem5 dd 10
mem6 dd 20
mem7 dd 225
.code
program:
mov eax, mem4
cdq
mov ebx, mem5
idiv ebx
sub mem3, eax
mov eax, mem2
add eax, mem3

mov ebx, mem1
imul ebx
sub eax, mem6
add eax, mem7
invoke wsprintfA, addr buffer, addr format, mem1, mem2, mem3, mem4, mem5, mem6, mem7, eax
invoke MessageBoxA, 0, ADDR buffer, ADDR TitleMsg,0
invoke ExitProcess,0
end program