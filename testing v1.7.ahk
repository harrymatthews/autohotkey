#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

DetectHiddenWindows, On

get_spotify_handle()
{
    WinGet, spotify_handle, ID, ahk_exe spotify.exe
    Return spotify_handle
}

spotify_key(key_pressed)
{
    spotify_handle := get_spotify_handle()
    ControlFocus, Chrome_RenderWidgetHostHWND1, ahk_id %spotify_handle%
    ControlSend, Chrome_RenderWidgetHostHWND1, %key_pressed%, ahk_id %spotify_handle%
    Return
}

^!p::
{
    Run, "C:\Users\HarrisonMatthews\AppData\Local\Microsoft\WindowsApps\Spotify.exe"
    Sleep, 500
    MouseClick, left
    Return
}

^!Up::
{
    spotify_handle := get_spotify_handle()
    WinGet, spotify_style, style, ahk_id %spotify_handle%
    if (spotify_style & 0x10000000)
    {
        WinHide, ahk_id %spotify_handle%
        MouseClick, left
    }
    Else
    {
        WinShow, ahk_id %spotify_handle%
        MouseClick, left
    }
    Return
}

^!Down::
{
    spotify_key("{Space}")
    Return
}

^!Left::
{
    spotify_key("^{Left}")
    Return
}

^!Right::
{
    spotify_key("^{Right}")
    Return
}

