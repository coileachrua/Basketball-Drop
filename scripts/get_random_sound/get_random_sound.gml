
function play_random_from_array(arr,sfx_enabled)
{
    if (array_length(arr) <= 0) return -1;

    var snd = arr[irandom(array_length(arr) - 1)];
    if (snd == -1) return -1;

    if (sfx_enabled && !audio_is_playing(snd)) {
         audio_play_sound(snd, 1, false);
    }

}
