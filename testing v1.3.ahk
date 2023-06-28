#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

DetectHiddenWindows, On

#IfWinExist, ahk_class, SpotifyMainWindow
WinGet, spotify, ID, ahk_class SpotifyMainWindow

!Up::
{
    WinActivate, ahk_id %spotify%
    Return
}

