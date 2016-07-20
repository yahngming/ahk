;Set
SetCapsLockState, Off
SetNumLockState, AlwaysOn
SetScrollLockState, AlwaysOff

;Bind
$Esc::
prevClipboard = %clipboard%
Send ^c
Sleep 50
Run https://www.google.com/search?q=%clipboard%
clipboard = %prevClipboard%
return
ScrollLock::
Send {PrintScreen}
Run pbrush
Sleep 100
Send ^v
return
Pause::Suspend
`::Esc
$+`::~
$^`::Send ``
Insert::
prevClipboard = %clipboard%
Send ^c
clipboard = %prevClipboard%`r`n%clipboard%
return
+Backspace::Send {Del}
NumLock::Run calc
CapsLock::Ctrl
<+RShift::CapsLock
>+LShift::CapsLock
LCtrl::#Space
#Q::WinClose, A

;Replace
:*?:+-::±
:*?:\/::×
:*?:/\::×
:*?:./.::÷
:*?:=/=::≠
:*?:u..::ü
:*?:''::°

;Mouse
!WheelUp::Volume_Up
!WheelDown::Volume_Down
!MButton::Volume_Mute
#LButton::
CoordMode, Mouse
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin%
if EWD_WinState = 0
    SetTimer, EWD_WatchMouse, 10
return
EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U
{
    SetTimer, EWD_WatchMouse, off
    return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D
{
    SetTimer, EWD_WatchMouse, off
    WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
    return
}
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX
EWD_MouseStartY := EWD_MouseY
return
