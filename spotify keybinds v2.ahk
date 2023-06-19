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
    controlfocus, Chrome_RenderWidgetHostHWND1, ahk_id %spotify_handle%
    controlsend, Chrome_RenderWidgetHostHWND1, %key_pressed%, ahk_id %spotify_handle%
    return 
}

^+Numpad0:: 
{
    spotify_handle := get_spotify_handle()

    if winexist("ahk_id" spotify_handle) 
    {
        winclose 
    }
    else 
    {
        run, "C:\Users\HarrisonMatthews\AppData\Local\Microsoft\WindowsApps\Spotify.exe"
        sleep, 500
        mouseclick, left
    }
    return
}

^+Up:: 
{
    spotify_handle := get_spotify_handle()
    winget, spotify_style, style, ahk_id %spotify_handle%

    if (spotify_style & 0x10000000) {
        winhide, ahk_id %spotify_handle%
        mouseclick, left
    }
    else {
        winshow, ahk_id %spotify_handle%
        mouseclick, left
    }
    return
}

^+Down:: 
{
    press_spotify_key("{Space}")
    return
}

^+Right:: 
{
    press_spotify_key("^{Right}")
    return
}

^+Left:: 
{
    press_spotify_key("^{Left}")
    return 
}

