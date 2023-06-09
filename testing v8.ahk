#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

DetectHiddenWindows, On

get_spotify_handle()
{
    WinGet, spotify_handle, ID, ahk_exe Spotify.exe
    Return spotify_handle
}

get_spotify_style()
{

    WinGet, spotify_style, style, ahk_exe Spotify.exe
    Return spotify_style
}

press_spotify_key(key_pressed)
{
    spotify_handle := get_spotify_handle()
    ControlFocus, Chrome_RenderWidgetHostHWND1, ahk_id %spotify_handle%
    ControlSend, Chrome_RenderWidgetHostHWND1, %key_pressed%, ahk_id %spotify_handle%
    Return
}

^!p::
{
    spotify_style := get_spotify_style()
    if (spotify_style & 0x10000000)
    {
        spotify_handle := get_spotify_handle()
        Process, Close, %spotify_handle%
    }
    Else
    {
        Run, "C:\Users\HarrisonMatthews\AppData\Local\Microsoft\WindowsApps\Spotify.exe"
        Sleep, 500
        MouseClick, left
    }
    Return
}

^!Up::
{
    spotify_style := get_spotify_style()
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
    press_spotify_key("{Space}")
    Return
}

^!Left::
{
    press_spotify_key("^{Left}")
    Return
}

^!Right::
{
    press_spotify_key("^{Right}")
    Return
}