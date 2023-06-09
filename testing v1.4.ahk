#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

DetectHiddenWindows, On

title := WinGetTitle("Spotify")

^+Up::
IfWinExist title
{
    IfWinActive title
    {
        WinMinimize
    }
    Else
    {
        WinActivate
    }
}
Else
{
    Run "C:\Users\HarrisonMatthews\AppData\Local\Microsoft\WindowsApps\Spotify.exe"
}
Return

^+Right::
DetectHiddenWindows, On
WinMenuSelectItem, ahk_class SpotifyMainWindow, , 4&, 3&
DetectHiddenWindows, Off
return


