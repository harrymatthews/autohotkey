#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;ControlClick, x3760 y1050, ahk_class Shell_SecondaryTrayWnd

spotify_key(key_pressed)
{
    ControlFocus, Chrome_RenderWidgetHostHWND1, ahk_class Chrome_WidgetWin_0
    ControlSend, Chrome_RenderWidgetHostHWND1, %key_pressed%, ahk_class Chrome_WidgetWin_0
    Return
}

^+Up::
{
    Run, "C:\Users\HarrisonMatthews\AppData\Local\Microsoft\WindowsApps\Spotify.exe"
    ;ControlClick, x3650 y5, ahk_class Chrome_WidgetWin_0

    Sleep, 3000
    MouseClick, Left, 1200, 1060
    Return
}

^+Down::
{
    spotify_key("{Space}")
    Return
}

^+Left::
{
    spotify_key("^{Left}")
    Return
}

^+Right::
{
    spotify_key("^{Right}")
    Return
}

