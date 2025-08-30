// obj_level_title – Step Event
timer++;

var fade_in = 30;
var hold = 30;
var fade_out = 30;

if (timer < fade_in) {
    alpha = timer / fade_in;
    scale = 1 + 0.1 * (timer / fade_in);
} else if (timer < fade_in + hold) {
    alpha = 1;
    scale = 1.1;
} else if (timer < fade_in + hold + fade_out) {
    var t = (timer - fade_in - hold) / fade_out;
    alpha = 1 - t;
    scale = 1.1 - 0.1 * t;
} else {
    instance_destroy();
}
