#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

DetectHiddenWindows, On

get_spotify_handle() {
    winget, spotify_handle, ID, ahk_exe Spotify.exe
    return spotify_handle
}

press_spotify_key(key_pressed) {
    spotify_handle := get_spotify_handle()
    spotify_class := Chrome_RenderWidgetHostHWND1
    controlfocus, %spotify_class%, ahk_id %spotify_handle%
    controlsend, %spotify_class%, %key_pressed%, ahk_id %spotify_handle%
    return 
}

hide_spotify_window() {
    spotify_handle := get_spotify_handle()
    winhide, ahk_id %spotify_handle%
    mouseclick, left
    return 
}

show_spotify_window() {
    spotify_handle := get_spotify_handle()
    winshow, ahk_id %spotify_handle%
    mouseclick, left
    return
}

^!Up::
{
    toggle := !toggle
    if (toggle = 0) {
        hide_spotify_window()
    }
    else {
        show_spotify_window()
    }
    return
}

^!Down::
{
    show_spotify_window()
    press_spotify_key("^!{f}")
    return
}
