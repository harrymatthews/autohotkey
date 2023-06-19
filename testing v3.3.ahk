#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

DetectHiddenWindows, On

spotify_class := Chrome_RenderWidgetHostHWND1
return

get_spotify_handle() {
    winget, spotify_handle, ID, ahk_exe Spotify.exe
    return spotify_handle
}

get_window_focus() {
    spotify_handle := get_spotify_handle()
    controlfocus, %spotify_class%, ahk_id %spotify_handle%
    return
}

press_spotify_key(key_pressed) {
    spotify_handle := get_spotify_handle()
    controlfocus, %spotify_class%, ahk_id %spotify_handle%
    controlsend, %spotify_class%, %key_pressed%, ahk_id %spotify_handle%
    return 
}


^!Up:: 
{
    spotify_handle := get_spotify_handle()
    winget, state, MinMax, ahk_id %spotify_handle%

    if (state = 1) {
        winhide, ahk_id %spotify_handle%
        get_window_focus()
    }
    else {
        winshow, ahk_id %spotify_handle%
        get_window_focus()
    }
    return
}

^!Down:: 
{
    press_spotify_key("{Space}")
    return
}

