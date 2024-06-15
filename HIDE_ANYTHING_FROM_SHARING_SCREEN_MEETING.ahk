if not A_IsAdmin
   Run *RunAs %A_ScriptFullPath%
; msgbox hi
 full_command_line := DllCall("GetCommandLine", "str")
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))

; If executable is built locally, use that instead
if FileExist(".\Build\bin\Release\Invisiwind.exe")
    SetWorkingDir Build\bin\Release

; When CTRL + J is pressed
^j::
WinGet, pid, PID, A
Run Invisiwind.exe --hide %pid%,, Hide
return

; When CTRL + J is pressed
^+j::
WinGet, pid, PID, A
Run Invisiwind.exe --unhide %pid%,, Hide
return
