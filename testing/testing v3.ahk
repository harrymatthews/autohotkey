#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

DetectHiddenWindows, On

^g::
{
    Run, % "http://www.google.com/search?hl=en&q=" Clipboard
    Return
}

^f::
{
    ExitApp
    Return
}