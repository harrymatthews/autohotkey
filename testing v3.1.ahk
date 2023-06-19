#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

DetectHiddenWindows, On

get_spotify_handle() {
    winget, spotify_handle, ID, ahk_exe Spotify.exe
    return spotify_handle
}

focus_window() {
    controlfocus, Chrome_RenderWidgetHostHWND1, ahk_exe Spotify.exe
    return
}

press_spotify_key(key_pressed) {
    spotify_handle := get_spotify_handle()
    controlfocus, Chrome_RenderWidgetHostHWND1, ahk_id %spotify_handle%
    controlsend, Chrome_RenderWidgetHostHWND1, %key_pressed%, ahk_id %spotify_handle%
    return 
}

^!Up:: 
{
    spotify_handle := get_spotify_handle()
    winget, spotify_style, style, ahk_id %spotify_handle%

    if (spotify_style & 0x10000000) {
        winhide, ahk_id %spotify_handle%
        controlfocus, Chrome_RenderWidgetHostHWND1, ahk_id %spotify_handle%
    }
    else {
        winshow, ahk_id %spotify_handle%
        controlfocus, Chrome_RenderWidgetHostHWND1, ahk_id %spotify_handle%
    }
    return
}

^!Down:: 
{
    press_spotify_key("{Space}")
    return
}


