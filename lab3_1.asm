.686p
.model flat, stdcall
option casemap : none
ExitProcess PROTO STDCALL :DWORD
MessageBoxA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD
wsprintfA PROTO C :VARARG
.data
TitleMsg db 'Find Y!',0
buffer db 128 dup(0)
format db 'Y1=-(A1+A2)/4, A1=%d, A2=%d : Y2=%d',0
A dd -4
B dd 4
Y dd ?
tmp dd ?

.code
start:

push B
push A
call procedure

add esp,8
mov Y, eax
	
invoke wsprintfA, addr buffer, addr format, A, B, Y
	
invoke MessageBoxA, 0, ADDR buffer, ADDR TitleMsg, 0
invoke ExitProcess, 0

procedure proc

mov eax, [esp+4]
mov edx, [esp+8]

add eax, edx
cwd
mov ebx,-4
idiv ebx

cmp eax,0
je p1
jmp other

p1:
	mov Y,12
	jmp fin
other:
	mov Y,-12
	jmp fin
	
fin:
	mov eax,Y
	ret
procedure endp

end start