#SingleInstance, Force

if not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%" ; (A_AhkPath is usually optional if the script has the .ahk extension.) You would typically check  first.p

; SetTitleMatchMode, 2
; HideWindow("Paste (F3")
; HideWindow("NOTION - FELIPE LULLIO")
; Return

; HideWindow(Window){
;    IfWinExist, %Window%
;    {
;       WinActivate, %Window%
;       WinWait %Window%
;       DetectHiddenWindows On
;       WinHide ; all of the following commands use the "last found window" determined by WinWait (above)

;       ; https://www.autohotkey.com/docs/commands/WinSet.htm#ExStyle
;       ; https://www.autohotkey.com/docs/misc/Styles.htm
;       ; ^0x80 = remove a janela do ALT+TAB list
;       ; remove janela do taskbar e aplica estilo
;       WinSet, ExStyle, +0x80
;       WinShow
;    }
; }


; https://www.autohotkey.com/docs/commands/WinGet.htm#ProcessName
^y::   ; press Windows+Escape to activate
WinGet, id, list, , , Program Manager
   Loop, %id%
   {  
      StringTrimRight, this_id, id%a_index%, 0

      ; pegar o nome da classe
      WinGetClass, this_class, ahk_id %this_id%
      ; pegar o nome do processo
      WinGet, this_process, ProcessName,ahk_id %this_id%
      ; pegar o nome do título
      WinGetTitle, this_title, ahk_id %this_id%
		; pegar estado
		WinGet, this_state, MinMax, %winTitle%

      ; style
      ; WinGet, Style, Style, ahk_id %this_id%

      ; msgbox % "Processo: " this_process A_Tab "Classe: " this_class A_Tab "Título: " this_title A_Tab "Id: " id
				; this_id := id%A_Index%
				; WinHide, ahk_id %this_id%
                     ; fechar tds janelas menos ...

            if(this_title > "" && (this_title != "Program Manager" || this_title != "Start Menu" || this_process != "Explorer") && this_class != "#32770" && this_state != -1 && !(InStr(this_title," - Visual Studio Code") || InStr(this_title, " - Google Chrome") || InStr(this_title, " - Mozilla Firefox") || InStr(this_process, "Notion.exe")) )
            ; if !(InStr(this_title," - Visual Studio Code") || InStr(this_title, " - Google Chrome") || InStr(this_title, " - Mozilla Firefox") || InStr(this_process, "Notion.exe"))
            {
               ; WinHide, ahk_id %this_id%
               winhide, %this_title%
            }
		}


         ; ; fechar tds janelas menos ...
         ; if !(InStr(this_title," - Visual Studio Code") || InStr(this_title, " - Google Chrome") || InStr(this_title, " - Mozilla Firefox") || InStr(this_process, "Notion.exe"))
         ; {
         ;    winhide, %this_title%
         ; }

return


