#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

DetectHiddenWindows, On

^g::
{
    previous_clipboard := ClipboardAll
    SendInput, ^c
    Run, % "http://www.google.com/search?hl=en&q=" Clipboard
    Return
}