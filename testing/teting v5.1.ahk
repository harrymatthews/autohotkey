#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

DetectHiddenWindows, On

get_spotify_handle() {
    winget, spotify_handle, ID, ahk_exe Spotify.exe
    return
}

press_spotify_key(key_pressed) {
    spotify_handle := get_spotify_handle()
    spotify_class := Chrome_RenderWidgetHostHWND1
    controlfocus, %spotify_class%, ahk_id %spotify_handle%
    controlsend, %spotify_class%, %key_pressed%, ahk_id %spotify_handle%
    msgbox, "got here"
    return 
}

^!Up:: 
{
    run, Spotify.exe
    spotify_handle := get_spotify_handle()
    winwait, ahk_id %spotify_handle%
    winmaximize
    mouseclick, left
    return
}

^!Down::
{
    press_spotify_key("{Space}")
    return
}