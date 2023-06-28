DetectHiddenWindows True

get_spotify_handle() {
    spotify_handle := ControlGetHwnd("Spotify")
    return spotify_handle
}

spotify_key(key_pressed) {
    spotify_handle := get_spotify_handle()
    ControlFocus, , Chrome_RenderWidgetHostHWND1, ahk_id %spotify_handle%
    ControlSend, , %key_pressed%, ahk_id %spotify_handle%
    return 
}
