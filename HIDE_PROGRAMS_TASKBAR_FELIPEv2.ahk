#SingleInstance, Force

SetTitleMatchMode, 2

if not A_IsAdmin
   Run *RunAs "%A_ScriptFullPath%" ; (A_AhkPath is usually optional if the script has the .ahk extension.) You would typically check  first.p

; https://www.autohotkey.com/docs/Hotkeys.htm#alttab
; https://www.autohotkey.com/docs/Hotkeys.htm
RAlt & j::AltTab ; altgr + j = comportamento do alt+tab
LAlt & CapsLock::AltTab ; alt da esquerda + capslock = comportamento do alt+tab
RAlt & k::ShiftAltTab

; F3:: ; Move bottom window to top
; F4:: ; Move top window to bottom
; win := []
; WinGet, wins, List
; Loop, %wins% {
;  WinGetTitle, ttitle, % winTitle := "ahk_id " wins%A_Index%
;  WinGet, proc, ProcessName, %winTitle%
;  WinGet, state, MinMax, %winTitle%
;  SplitPath, proc,,,, proc
;  WinGetClass, class, %winTitle%
;  If (ttitle > "" && (ttitle != "Program Manager" || proc != "Explorer") && class != "#32770" && ( ( InStr(ttitle," - Visual Studio Code") || InStr(ttitle, " - Google Chrome") || InStr(ttitle, "Mozilla Firefox") || InStr(proc, "Notion") || InStr(ttitle, "H:\My Drive\autohotkey\Meus-Scripts") )))
;   If proc not in Rainmeter
;    ; MsgBox, %proc%
;    win.Push(wins%A_Index%)
;    WinSet, ExStyle, ^0x80, % "ahk_id " win[win.Count()]
; }

; If (A_ThisHotkey = "F4") {
;  WinSet, Bottom,  , % "ahk_id " win.1
;  WinActivate      , % "ahk_id " win.2
; } Else WinActivate, % "ahk_id " win[win.Count()]
; Return

/*
esse f3 ta bugado, usar o f6
*/
F3:: ; Move bottom window to top
; F4:: ; Move top window to bottom
win := []
WinGet, id, List
count:=1
Loop, %id% {
   StringTrimRight, this_id, id%a_index%, 0
   
   WinGetTitle, ttitle, ahk_id %this_id%
   WinGet, proc, ProcessName, ahk_id %this_id%
   ; MsgBox, % ttitle " - "
   WinGet, _pid, PID, ahk_id %this_id%
   WinGet, state, MinMax, ahk_id %this_id%
   ; SplitPath, proc,,,, proc
   WinGetClass, class, ahk_id %this_id%
   SetTitleMatchMode, 2
   DetectHiddenWindows On ;not sure why this is needed
   
   If (ttitle > ""  && !( InStr(ttitle, "Mozilla Firefox") || InStr(ttitle, " - Visual Studio Code") || InStr(ttitle, "Trello")|| InStr(proc, "Notion") || InStr(proc, "WindowsTerminal")) && (ttitle != "Program Manager") ) ; ||InStr(ttitle, " - Google Chrome") || ttitle = "H:\My Drive\autohotkey\Meus-Scripts"  || proc != "Explorer" 
   {     
         ; MsgBox, % ttitle
         win.Push(id%A_Index%)
         ; MsgBox, % win[count]
         SetTitleMatchMode, 2
         DetectHiddenWindows On ;not sure why this is needed
         ; WinSet, ExStyle, ^0x80, %ttitle%
         ; WinSet, ExStyle, ^0x80, % "ahk_class " class
         WinMinimize, % "ahk_id " this_id
         WinSet, ExStyle, ^0x80, % "ahk_id " this_id
         ; WinSet, ExStyle, ^0x80, % "ahk_pid " _pid
         ; WinSet, ExStyle, ^0x80, % ttitle
         ; count++
   }
}

F6:: ; Move bottom window to top
; F4:: ; Move top window to bottom
win := []
WinGet, id, List
count:=1
Loop, %id% {
   StringTrimRight, this_id, id%a_index%, 0
   
   WinGetTitle, ttitle, ahk_id %this_id%
   WinGet, proc, ProcessName, ahk_id %this_id%
   ; MsgBox, % ttitle " - "
   WinGet, _pid, PID, ahk_id %this_id%
   WinGet, state, MinMax, ahk_id %this_id%
   ; SplitPath, proc,,,, proc
   WinGetClass, class, ahk_id %this_id%
   SetTitleMatchMode, 2
   DetectHiddenWindows On ;not sure why this is needed
   
   If (ttitle > ""  && !( InStr(ttitle, "Mozilla Firefox") || InStr(ttitle, " - Visual Studio Code") || InStr(ttitle, "Trello")|| InStr(proc, "Notion") || InStr(proc, "WindowsTerminal")) && (ttitle != "Program Manager") ) ; ||InStr(ttitle, " - Google Chrome") || ttitle = "H:\My Drive\autohotkey\Meus-Scripts"  || proc != "Explorer" 
   {     
         ; MsgBox, % ttitle
         win.Push(id%A_Index%)
         ; MsgBox, % win[count]
         SetTitleMatchMode, 2
         DetectHiddenWindows On ;not sure why this is needed
         ; WinSet, ExStyle, ^0x80, %ttitle%
         ; WinSet, ExStyle, ^0x80, % "ahk_class " class
         WinMinimize, % "ahk_id " this_id
         WinSet, ExStyle, ^0x80, % "ahk_id " this_id
         ; WinSet, ExStyle, ^0x80, % "ahk_pid " _pid
         ; WinSet, ExStyle, ^0x80, % ttitle
         ; count++
   }
}
; F3:: ; Move bottom window to top
; F4:: ; Move top window to bottom
; win := []
; WinGet, wins, List
; count:=1
; Loop, %wins% {
;    WinGetTitle, ttitle, % winTitle := "ahk_id " wins%A_Index%
;    WinGet, proc, ProcessName, %winTitle%
;    ; MsgBox, % ttitle " - "
;    WinGet, _pid, PID, %winTitle%
;    WinGet, state, MinMax, %winTitle%
;    SplitPath, proc,,,, proc
;    WinGetClass, class, %winTitle%
;    SetTitleMatchMode, 2
;    If (ttitle > "" && (ttitle != "Program Manager" || proc != "Explorer") && class != "#32770" && !( InStr(ttitle, "Mozilla Firefox") ||InStr(ttitle, " - Google Chrome") || ttitle = "H:\My Drive\autohotkey\Meus-Scripts" || InStr(ttitle, " - Visual Studio Code") || InStr(proc, "Notion") ))
;    {     
;          ; MsgBox, % ttitle
;          win.Push(wins%A_Index%)
;          ; MsgBox, % win[count]
;          WinSet, ExStyle, ^0x80, % "ahk_id " win[win.Count()]
;          ; WinSet, ExStyle, ^0x80, % "ahk_exe " %proc%
;          ; WinSet, ExStyle, ^0x80, % "ahk_id " win[count]
;          ; WinSet, ExStyle, ^0x80, % "ahk_pid " _pid
;          ; WinSet, ExStyle, ^0x80, % ttitle
;          ; count++
;    }
; }

/*
&& !( InStr(ttitle,"Visual Studio Code") || InStr(ttitle, " - Google Chrome") || InStr(ttitle, "Mozilla Firefox") || InStr(proc, "Notion") ||InStr(proc, "Code") || InStr(ttitle, "H:\My Drive\autohotkey\Meus-Scripts") )
*/