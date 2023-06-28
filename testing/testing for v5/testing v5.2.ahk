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
    winminimize, ahk_id %spotify_handle%
    msgbox, "minimised"
    return
}

show_spotify_window() {
    spotify_handle := get_spotify_handle()
    winmaximize, ahk_id %spotify_handle%
    msgbox, "maximised"
    return
}

toggle_spotify_window() {
    spotify_handle := get_spotify_handle()
    winrestore, ahk_id %spotify_handle%
    msgbox, "toggled"
    return
}

^!Up::
{
    toggle_spotify_window()
    return
}

^!Down::
{
    press_spotify_key("{Space}")
    return
}

