.686p
.model flat, stdcall
option casemap : none
ExitProcess PROTO STDCALL :DWORD ;функци€ из библиотеки kernel32.lib
MessageBoxA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD ;функци€ из библиотеки user32.lib

.data
TextMsg db 'Ёто перва€ программа дл€ Win32',0
TitleMsg db 'язык јссемблера Masm32!',0
.const
MB_OK equ 0
.code
start:
push MB_OK
push offset TitleMsg
push offset TextMsg
push 0
call MessageBoxA

push 0
call ExitProcess

end start