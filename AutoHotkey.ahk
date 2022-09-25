PrintScreen::#+S
`::Esc
$+`::~
$^`::Send ``
+Backspace::Del
CapsLock::Ctrl
<+RShift::CapsLock
>+LShift::CapsLock
Ctrl::#Space
!LButton::
    CoordMode,Mouse
    MouseGetPos,KDE_X1,KDE_Y1,KDE_id
    WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
    If KDE_Win = 0
        SetTimer,KDE_Drag,10
    return
!RButton::
    CoordMode,Mouse
    MouseGetPos,KDE_X1,KDE_Y1,KDE_id
    WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
    If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
        KDE_WinLeft := 1
    Else
        KDE_WinLeft := -1
    If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
        KDE_WinUp := 1
    Else
        KDE_WinUp := -1
    If KDE_Win = 0
        SetTimer,KDE_Resize,10
    return
!WheelUp::
    MouseGetPos,,,KDE_id
    WinMaximize,ahk_id %KDE_id%
    return
!WheelDown::
    MouseGetPos,,,KDE_id
    WinRestore,ahk_id %KDE_id%
    return

KDE_Drag:
    GetKeyState,KDE_Button,LButton,P
    If KDE_Button = U
    {
        SetTimer,KDE_Drag,off
        return
    }
    CoordMode,Mouse
    MouseGetPos,KDE_X2,KDE_Y2
    WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%
    KDE_X2 -= KDE_X1
    KDE_Y2 -= KDE_Y1
    SetWinDelay,-1
    WinMove,ahk_id %KDE_id%,,KDE_WinX1 + KDE_X2,KDE_WinY1 + KDE_Y2
    KDE_X1 += KDE_X2
    KDE_Y1 += KDE_Y2
    return
KDE_Resize:
    GetKeyState,KDE_Button,RButton,P
    If KDE_Button = U
    {
        SetTimer,KDE_Resize,off
        return
    }
    CoordMode,Mouse
    MouseGetPos,KDE_X2,KDE_Y2
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
    KDE_X2 -= KDE_X1
    KDE_Y2 -= KDE_Y1
    SetWinDelay,-1
    WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2
                            , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2
                            , KDE_WinW  -     KDE_WinLeft  *KDE_X2
                            , KDE_WinH  -       KDE_WinUp  *KDE_Y2
    KDE_X1 += KDE_X2
    KDE_Y1 += KDE_Y2
    return

:*?:+-::±
:*?:\/::×
:*?:/\::×
:*?:./.::÷
:*?:=/=::≠
:*?:u..::ü
:*?:''::°
