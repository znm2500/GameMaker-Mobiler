draw_sprite_ext(spr_black_mobile, 0, 0, 0, 1, 1, 0, c_white, black_fade);
draw_sprite_ext(spr_arrow_leftright_mobile, 0, 459.5, 75, 2, 2, 0, button_colour, text_black_fade);
draw_sprite_ext(spr_arrow_leftright_mobile, 0, 459.5, 121, 2, 2, 0, button_colour, text_black_fade);
draw_sprite_ext(spr_arrow_leftright_mobile, 0, 459.5, 167, 2, 2, 0, button_colour, text_black_fade);
draw_sprite_ext(spr_button_scale, global.mobile_cn, 120.5, 75, 2, 2, 0, button_colour, text_black_fade);
draw_sprite_ext(spr_controls_opacity, global.mobile_cn, 106.5, 167, 2, 2, 0, button_colour, text_black_fade);
draw_sprite_ext(spr_analog_scale, global.mobile_cn, 120.5, 121, 2, 2, 0, button_colour, text_black_fade);
draw_sprite_ext(spr_controls_config, global.mobile_cn, 220, 22.5, 2, 2, 0, button_colour, text_black_fade);
draw_sprite_ext(spr_reset_config, global.mobile_cn, 241, 412.25, 2, 2, 0, button_colour, text_black_fade);

if (edit == 2 || edit == 1 || (edit == 0 && black_fade > 0))
{
    var _old_font = draw_get_font();
    var _old_halign = draw_get_halign();
    draw_set_halign(fa_center);
    draw_set_font(settings_font);
    draw_text_colour(settings_num_x, settings_num_y + 67, button_scale, button_colour, button_colour, button_colour, button_colour, text_black_fade);
    draw_text_colour(settings_num_x, settings_num_y + 113, analog_scale, button_colour, button_colour, button_colour, button_colour, text_black_fade);
    draw_text_colour(settings_num_x, settings_num_y + 159, controls_opacity, button_colour, button_colour, button_colour, button_colour, text_black_fade);
    draw_set_font(_old_font);
    draw_set_halign(_old_halign);
}

draw_sprite_ext(spr_z_button, keyboard_check(ord("Z")), zx, zy, button_scale, button_scale, 0, button_colour, controls_opacity * image_alpha);
draw_sprite_ext(spr_x_button, keyboard_check(ord("X")), xx, xy, button_scale, button_scale, 0, button_colour, controls_opacity * image_alpha);
draw_sprite_ext(spr_c_button, keyboard_check(ord("C")), cx, cy, button_scale, button_scale, 0, button_colour, controls_opacity * image_alpha);

if (global.mobile_f2 == 1)
    draw_sprite_ext(spr_button_restart, keyboard_check(vk_f2), f2x, f2y, button_scale, button_scale, 0, button_colour, controls_opacity * image_alpha);

if (global.mobile_heal == 1)
    draw_sprite_ext(spr_button_h, keyboard_check(ord("H")), hx, hy, button_scale, button_scale, 0, button_colour, controls_opacity * image_alpha);

if (global.Android_System_Keyboard == 1)
    draw_sprite_ext(spr_mobile_pad, keyboard_check(vk_numpad9), keyboardx, keyboardy, 2, 2, 0, button_colour, 0.5);

draw_sprite_ext(spr_button_left, keyboard_check(vk_left), leftx, lefty, analog_scale, analog_scale, 0, button_colour, controls_opacity * image_alpha);
draw_sprite_ext(spr_button_up, keyboard_check(vk_up), upx, upy, analog_scale, analog_scale, 0, button_colour, controls_opacity * image_alpha);
draw_sprite_ext(spr_button_right, keyboard_check(vk_right), rightx, righty, analog_scale, analog_scale, 0, button_colour, controls_opacity * image_alpha);
draw_sprite_ext(spr_button_down, keyboard_check(vk_down), downx, downy, analog_scale, analog_scale, 0, button_colour, controls_opacity * image_alpha);
draw_sprite_ext(spr_settings_mobile, keyboard_check(92), -50, 5, 2, 2, 0, button_colour, 0.5);
