@echo off
my_sdk\ml.exe /c %1.asm
my_sdk\link.exe /DEFAULTLIB:my_sdk\kernel32.lib /DEFAULTLIB:my_sdk\user32.lib /DEFAULTLIB:my_sdk\gdi32.lib /SUBSYSTEM:WINDOWS %1.obj
if exist %1.obj del %1.obj
dir %1.*
pause