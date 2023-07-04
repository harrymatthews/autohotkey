#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

DetectHiddenWindows, On

^g::
{
    SendInput, ^c
    Run, % "http://www.google.com/search?hl=en&q=" Clipboard
}