.686p
.model flat, stdcall
option casemap : none
ExitProcess PROTO STDCALL :DWORD
MessageBoxA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD
wsprintfA PROTO C :VARARG
.data
TitleMsg db 'Find Y!',0
buffer db 128 dup(0)
format db 'Z1=A-B Z2=A+B, A=%d, B=%d : Y=%d',0
A dd 10
B dd 5
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
mov tmp, eax

add tmp, edx
sub eax, edx

cmp eax,0
je p1
jl p2
jmp other

p1:
	cmp tmp,0
	je p11
	jmp other
	
p2:
	cmp tmp,0
	je p22
	jmp other
	
p11:
	mov Y,1
	jmp fin
	
p22:
	mov Y,2
	jmp fin

other:
	mov Y,3
	jmp fin
	
fin:
	mov eax,Y
	ret
procedure endp

end start