#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
 ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

times = 1
done = 0


; loop it all pics in folder minus 3, and get the first pic manually
Loop 2
{

IfWinNotExist ahk_class CmpView
{
	run, cmpview,,, OutputVarPID 
	WinWait, ahk_pid %OutputVarPID%
	WinActivate
	WinWaitActive
}
else
{
	WinActivate, ahk_class CmpView
	WinWaitActive, ahk_class CmpView
}

SendInput, {Alt Down}f{Alt Up}
SendInput, o
WinWait, ahk_class #32770 ahk_exe cmpview.exe 
WinActivate, ahk_class #32770 ahk_exe cmpview.exe
WinWaitActive, ahk_class #32770 ahk_exe cmpview.exe
SendInput, {Alt Down}d{Alt Up}
Sleep, 100

Loop, 4
{
	SendInput, {Tab Down}
	SendInput, {Tab Up}
	Sleep, 50
}


if (done == 0)
{
	SendInput, {Down Down}{Down Up}
	SendInput, {Up Down}{Up Up}
	done += 1
}
else
{
	Loop %times%
	{
		SendInput, {Down Down}{Down Up}
		Sleep, 20
		
	}
	times += 1
}

sleep, 1000
SendInput, {Alt Down}o{Alt Up}

WinWait, ahk_class CmpView ahk_exe cmpview.exe 
WinActivate, ahk_class CmpView ahk_exe cmpview.exe 
WinWaitActive, ahk_class CmpView ahk_exe cmpview.exe 

PostMessage, 0x0112, 0xF120,,, CmpView ahk_class CmpView ahk_exe cmpview.exe
PostMessage, 0x0112, 0xF030,,, CmpView ahk_class CmpView ahk_exe cmpview.exe
Sleep, 200

WinGetTitle, title, CmpView


cmp := "1 of 1"

;get title of texture


titlestring := StrSplit(title)
tex := []
index = 11
count = 0

while (titlestring[index] != ".")
{
	
	tex[count] := titlestring[index]
	index += 1
	count += 1
}

count += 1 ;there is +1 chars in tex

name = 

for index, char in tex
{
	name .= char
}

If InStr(title, cmp)
{
	Run, %A_ScriptDir%\MiniCap.exe -captureregion 576 417 703 544 -capsound -exit -save "C:\Users\arnas\Desktop\bowieworld_failai\bwart2\%name%.bmp"

	WinActivate, ahk_class CmpView
	WinWaitActive, ahk_class CmpView
	
}

Else
{
	frame := SubStr(title, -1) / 4
	froom = 1
	append = 1
	
	FileCreateDir, %A_ScriptDir%\%name%
	
	Loop, %frame%
	{
		append = 1
		Loop, 4
		{
		
		Run, %A_ScriptDir%\MiniCap.exe -captureregion 576 417 703 544 -capsound -exit -save "%A_ScriptDir%\%name%\%froom%\%name%_%append%.bmp"
		WinActivate, ahk_class CmpView
		WinWaitActive, ahk_class CmpView
		SendInput, {Alt Down}i{Alt Up}
		SendInput, n
		append += 1
		}
		
		Run, %comspec% /c "magick montage -geometry +0+0 %A_ScriptDir%\%name%\%froom%\*.bmp %A_ScriptDir%\%name%\%froom%.bmp"
		froom += 1
	}
	
	
    
}

}

return