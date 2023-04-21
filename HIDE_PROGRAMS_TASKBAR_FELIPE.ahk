#SingleInstance, Force
SetWorkingDir, A_ScriptDir

if not A_IsAdmin
   Run *RunAs "%A_ScriptFullPath%" ;  ; (A_AhkPath is usually optional if the script has the .ahk extension.) You would typically check  first.p

; https://www.autohotkey.com/docs/Hotkeys.htm#alttab
; https://www.autohotkey.com/docs/Hotkeys.htm
; RAlt & j::AltTab ; altgr + j = comportamento do alt+tab
; LAlt & CapsLock::AltTab ; alt da esquerda + capslock = comportamento do alt+tab
; RAlt & k::ShiftAltTab

F6::
WinGet, id, List,,, Program Manager
Loop, %id% 
{
   this_id := id%A_Index%
   WinActivate, ahk_id %this_id%
   WinGetClass, this_class, ahk_id %this_id%
   WinGetTitle, this_title, ahk_id %this_id%
   WinGet, proc, ProcessName, ahk_id %this_id%
   ; MsgBox, % ttitle " - "
   WinGet, _pid, PID, ahk_id %this_id%
   WinGet, state, MinMax, ahk_id %this_id%

   ; SplitPath, proc,,,, proc
   SetTitleMatchMode, 2
   DetectHiddenWindows On ;not sure why this is needed
   
      If (this_title > ""  && !( InStr(this_title, "Mozilla Firefox") || InStr(this_title, " - Visual Studio Code") || InStr(proc, "Notion.exe") || this_class = "AutoHotkeyGUI" || InStr(proc, "WindowsTerminal"))  ) ; ||InStr(ttitle, " - Google Chrome") || ttitle = "H:\My Drive\autohotkey\Meus-Scripts"  || proc != "Explorer" 
      {     
         ; ATIVAR AQUI D EVOLTA
         DetectHiddenWindows On ;not sure why this is needed

            /*WinMinimize não funciona bem, ele minimiza e fica aparecendo o titulo no rodapé da tela..para resolver isso usei o código abaixo, ai minimiza corretamente
            OBS: precisa usar esse código antes do WinSet
            */
            ; WinMinimize, ahk_id %this_id%
            

            ; PostMessage, 0x0112, 0xF120,,,%this_title% ; DESMINIMIZA A TELA
            /*a verificação abaixo serve pra resolver o problema de quando apertar F6 novamente pra aparecer as janelas que foram minimizas/excluidas do alt+tab ele vai executar o minimizar nelas de novo tbm e fica no rodapé com título, então checamos se existe o estilo aplicado na janela pra depois minimizar.
            */
            WinGet, ExStyle, ExStyle, %this_title%
            if !(ExStyle & 0x80)
               {
                  PostMessage, 0x0112, 0xF020,,, %this_title% ; MINIMIZA A TELA
                  WinSet, ExStyle, +0x80, %this_title%
               }
               Else{
                  WinSet, ExStyle, -0x80, %this_title%
               }
            ; msgbox %Height%
            ; WinMinimize, %this_title%
            ; WinMinimize, %this_title%

   }
}