
DetectHiddenWindows, On

get_spotify_handle() 
{
    WinGet, spotify_handle, ID, ahk_exe spotify.exe 
    spotify_handle := DllCall("GetWindow", "uint", spotify_handle, "uint", 2)
    spotify_handle := DllCall("GetWindow", "uint", spotify_handle, "uint", 2)
    Return spotify_handle
}

spotify_key(key_pressed) 
{
    spotify_handle := get_spotify_handle()
    ControlFocus, ,Chrome_RenderWidgetHostHWND1, ahk_id %spotify_handle%
    ControlSend, ,%key_pressed%, ahk_id %spotify_handle%
    Return
}

!Down::
{
    spotify_key("{Space}")
    Return
}

!Up::
{
    spotify_handle := get_spotify_handle()
    WinGet, style, style, ahk_id %spotify_handle%
    if (style & 0x10000000) {
        WinHide, ahk_id %spotify_handle%
    }

    else {
        WinShow, ahk_id %spotify_handle%
        WinActivate, ahk_id %spotify_handle%
    }
    Return
}

