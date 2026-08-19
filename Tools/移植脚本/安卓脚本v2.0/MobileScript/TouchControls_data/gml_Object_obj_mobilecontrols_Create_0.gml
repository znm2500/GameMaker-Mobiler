hello = "你好啊，喜欢的话就用吧";
settx = -50;
setty = 5;
keyboardx = 652;
keyboardy = 5;
settings_font = global.joystick_font;
settings_num_x = 503;
settings_num_y = 6.5;
button_colour = 16777215;
zx = 404;
zy = 338;
xx = 488;
xy = 294;
cx = 573;
cy = 253;
hx = 556;
hy = 5;
f2x = 5;
f2y = 5;
button_scale = 3;
analog_scale = 3.5;
analog_posx = -42;
analog_posy = 232.5;
analog_edit_selected = 0;
analog_center_x = analog_posx + (((59 * analog_scale) / 2) - ((41 * analog_scale) / 2));
analog_center_y = analog_posy + (((59 * analog_scale) / 2) - ((41 * analog_scale) / 2));
arrowkeys_area_size = 19.675;
arrowkeys_back_area_size = 45;
joystick_type = 0;
show = 1;
edit = 0;
black_fade = 0;
text_black_fade = 0;
controls_opacity = 0.5;
image_alpha = 1;
active_key = -1;

if (global.mobile_prioritize_display == 1)
    depth = -16000;

if (global.mobile_prioritize_display == 2)
    depth = -infinity;

if (file_exists("touchconfig.ini"))
{
    ini_open("touchconfig.ini");
    zx = ini_read_real("CONFIG", "zx", zx);
    zy = ini_read_real("CONFIG", "zy", zy);
    xx = ini_read_real("CONFIG", "xx", xx);
    xy = ini_read_real("CONFIG", "xy", xy);
    cx = ini_read_real("CONFIG", "cx", cx);
    cy = ini_read_real("CONFIG", "cy", cy);
    f2x = ini_read_real("CONFIG", "f2x", f2x);
    f2y = ini_read_real("CONFIG", "f2y", f2y);
    hx = ini_read_real("CONFIG", "hx", hx);
    hy = ini_read_real("CONFIG", "hy", hy);
    analog_posx = ini_read_real("CONFIG", "analog_posx", analog_posx);
    analog_posy = ini_read_real("CONFIG", "analog_posy", analog_posy);
    button_scale = ini_read_real("CONFIG", "button_scale", button_scale);
    analog_scale = ini_read_real("CONFIG", "analog_scale", analog_scale);
    joystick_type = ini_read_real("CONFIG", "joystick_type", joystick_type);
    controls_opacity = ini_read_real("CONFIG", "controls_opacity", controls_opacity);
    ini_close();
}
