if (global.Android_System_Keyboard == 1)
{
    if (keyboard_check_pressed(vk_numpad9))
        keyboard_virtual_show(1, 3, 0, 0);
}

if (keyboard_check(126))
{
    if (device_mouse_x_to_gui(0) >= analog_posx && device_mouse_x_to_gui(0) <= (analog_posx + (59 * analog_scale)))
        analog_center_x = device_mouse_x_to_gui(0) - (21 * analog_scale);
    
    if (device_mouse_y_to_gui(0) >= analog_posy && device_mouse_y_to_gui(0) <= (analog_posy + (59 * analog_scale)))
        analog_center_y = device_mouse_y_to_gui(0) - (21 * analog_scale);
}
else
{
    analog_center_x = analog_posx + (((59 * analog_scale) / 2) - ((41 * analog_scale) / 2));
    analog_center_y = analog_posy + (((59 * analog_scale) / 2) - ((41 * analog_scale) / 2));
}

if (keyboard_check_pressed(92))
{
    edit += 1;
    
    if (edit == 1)
    {
        show = 1;
        audio_play_sound(snd_spearappear_mobile, 0, false);
    }
    else if (edit == 3)
    {
        audio_play_sound(snd_egg_mobile, 0, false);
        virtual_key_delete(virtual_key_up);
        virtual_key_delete(virtual_key_down);
        virtual_key_delete(virtual_key_left);
        virtual_key_delete(virtual_key_right);
        virtual_key_delete(virtual_key_z);
        virtual_key_delete(virtual_key_x);
        virtual_key_delete(virtual_key_c);
        
        if (global.mobile_f2 == 1)
        {
            virtual_key_delete(virtual_key_restart);
            virtual_key_delete(virtual_key_restartp);
        }
        
        if (global.mobile_heal == 1)
        {
            virtual_key_delete(virtual_key_h);
            virtual_key_delete(virtual_key_hp);
        }
        
        virtual_key_delete(virtual_key_zp);
        virtual_key_delete(virtual_key_xp);
        virtual_key_delete(virtual_key_cp);
        virtual_key_delete(virtual_key_analog);
        virtual_key_delete(virtual_key_analogp);
        ini_open("touchconfig.ini");
        ini_write_real("CONFIG", "zx", zx);
        ini_write_real("CONFIG", "zy", zy);
        ini_write_real("CONFIG", "xx", xx);
        ini_write_real("CONFIG", "xy", xy);
        ini_write_real("CONFIG", "cx", cx);
        ini_write_real("CONFIG", "cy", cy);
        ini_write_real("CONFIG", "f2x", f2x);
        ini_write_real("CONFIG", "f2y", f2y);
        ini_write_real("CONFIG", "hx", hx);
        ini_write_real("CONFIG", "hy", hy);
        ini_write_real("CONFIG", "analog_posx", analog_posx);
        ini_write_real("CONFIG", "analog_posy", analog_posy);
        ini_write_real("CONFIG", "button_scale", button_scale);
        ini_write_real("CONFIG", "analog_scale", analog_scale);
        ini_write_real("CONFIG", "joystick_type", joystick_type);
        ini_write_real("CONFIG", "controls_opacity", controls_opacity);
        ini_close();
        edit = 0;
        scr_add_keys();
    }
}

image_alpha = (show == 1) ? min(image_alpha + 0.1, 1) : max(image_alpha - 0.1, 0);
black_fade = (edit == 0) ? max(black_fade - 0.04, 0) : min(black_fade + 0.04, 0.4);
text_black_fade = (edit == 0) ? max(text_black_fade - 0.09, 0) : min(text_black_fade + 0.09, 0.9);

if (edit == 0)
    exit;

virtual_key_delete(virtual_key_up);
virtual_key_delete(virtual_key_down);
virtual_key_delete(virtual_key_left);
virtual_key_delete(virtual_key_right);
virtual_key_delete(virtual_key_z);
virtual_key_delete(virtual_key_x);
virtual_key_delete(virtual_key_c);

if (global.mobile_f2 == 1)
{
    virtual_key_delete(virtual_key_restart);
    virtual_key_delete(virtual_key_restartp);
}

if (global.mobile_heal == 1)
{
    virtual_key_delete(virtual_key_h);
    virtual_key_delete(virtual_key_hp);
}

virtual_key_delete(virtual_key_zp);
virtual_key_delete(virtual_key_xp);
virtual_key_delete(virtual_key_cp);
virtual_key_delete(virtual_key_analog);
virtual_key_delete(virtual_key_analogp);
scr_add_keys();

if (active_key == -1)
{
    if (keyboard_check_pressed(125))
    {
        active_key = 125;
        audio_play_sound(snd_noise_mobile, 0, false);
    }
    else if (keyboard_check_pressed(124))
    {
        active_key = 124;
        audio_play_sound(snd_noise_mobile, 0, false);
    }
    else if (keyboard_check_pressed(94))
    {
        active_key = 94;
        audio_play_sound(snd_noise_mobile, 0, false);
    }
    else if (keyboard_check_pressed(93))
    {
        active_key = 93;
        audio_play_sound(snd_noise_mobile, 0, false);
    }
    else if (keyboard_check_pressed(vk_numpad5))
    {
        active_key = 101;
        audio_play_sound(snd_noise_mobile, 0, false);
    }
    else if (keyboard_check_pressed(vk_numpad0))
    {
        active_key = 96;
        audio_play_sound(snd_noise_mobile, 0, false);
    }
}

if (active_key != -1 && keyboard_check_released(active_key))
{
    audio_play_sound(snd_menu_confirm_mobile, 0, false);
    active_key = -1;
}

if (active_key == 125)
{
    zx = device_mouse_x_to_gui(0) - (13.5 * button_scale);
    zy = device_mouse_y_to_gui(0) - (12.5 * button_scale);
}
else if (active_key == 124)
{
    xx = device_mouse_x_to_gui(0) - (13.5 * button_scale);
    xy = device_mouse_y_to_gui(0) - (12.5 * button_scale);
}
else if (active_key == 94)
{
    cx = device_mouse_x_to_gui(0) - (13.5 * button_scale);
    cy = device_mouse_y_to_gui(0) - (12.5 * button_scale);
}
else if (active_key == 101)
{
    f2x = device_mouse_x_to_gui(0) - (13.5 * button_scale);
    f2y = device_mouse_y_to_gui(0) - (12.5 * button_scale);
}
else if (active_key == 96)
{
    hx = device_mouse_x_to_gui(0) - (13.5 * button_scale);
    hy = device_mouse_y_to_gui(0) - (12.5 * button_scale);
}
else if (active_key == 93)
{
    analog_posx = device_mouse_x_to_gui(0) - (29.5 * analog_scale);
    analog_posy = device_mouse_y_to_gui(0) - (29.5 * analog_scale);
}

if (device_mouse_x_to_gui(0) >= 440.5 && device_mouse_y_to_gui(0) >= 75 && device_mouse_x_to_gui(0) <= 469.5 && device_mouse_y_to_gui(0) <= 93 && mouse_check_button_pressed(mb_left))
{
    if (button_scale > 1)
    {
        button_scale -= 0.1;
        audio_play_sound(snd_equip_mobile, 0, false);
    }
    else
    {
        audio_play_sound(snd_hurt_mobile, 0, false);
    }
}

if (device_mouse_x_to_gui(0) >= 531.5 && device_mouse_y_to_gui(0) >= 75 && device_mouse_x_to_gui(0) <= 561.5 && device_mouse_y_to_gui(0) <= 93 && mouse_check_button_pressed(mb_left))
{
    button_scale += 0.1;
    audio_play_sound(snd_coin_mobile, 0, false);
}

if (device_mouse_x_to_gui(0) >= 440.5 && device_mouse_y_to_gui(0) >= 121 && device_mouse_x_to_gui(0) <= 469.5 && device_mouse_y_to_gui(0) <= 139 && mouse_check_button_pressed(mb_left))
{
    if (analog_scale > 1)
    {
        analog_scale -= 0.1;
        audio_play_sound(snd_equip_mobile, 0, false);
    }
    else
    {
        audio_play_sound(snd_hurt_mobile, 0, false);
    }
}

if (device_mouse_x_to_gui(0) >= 531.5 && device_mouse_y_to_gui(0) >= 121 && device_mouse_x_to_gui(0) <= 561.5 && device_mouse_y_to_gui(0) <= 139 && mouse_check_button_pressed(mb_left))
{
    analog_scale += 0.1;
    audio_play_sound(snd_coin_mobile, 0, false);
}

if (device_mouse_x_to_gui(0) >= 440.5 && device_mouse_y_to_gui(0) >= 167 && device_mouse_x_to_gui(0) <= 469.5 && device_mouse_y_to_gui(0) <= 185 && mouse_check_button_pressed(mb_left))
{
    if (joystick_type == 1)
    {
        joystick_type -= 1;
        audio_play_sound(snd_equip_mobile, 0, false);
    }
    else
    {
        audio_play_sound(snd_hurt_mobile, 0, false);
    }
}

if (device_mouse_x_to_gui(0) >= 531.5 && device_mouse_y_to_gui(0) >= 167 && device_mouse_x_to_gui(0) <= 561.5 && device_mouse_y_to_gui(0) <= 185 && mouse_check_button_pressed(mb_left))
{
    if (joystick_type == 0)
    {
        joystick_type += 1;
        audio_play_sound(snd_coin_mobile, 0, false);
    }
    else
    {
        audio_play_sound(snd_hurt_mobile, 0, false);
    }
}

if (device_mouse_x_to_gui(0) >= 440.5 && device_mouse_y_to_gui(0) >= 213 && device_mouse_x_to_gui(0) <= 469.5 && device_mouse_y_to_gui(0) <= 231 && mouse_check_button_pressed(mb_left))
{
    if (controls_opacity > 0.1)
    {
        controls_opacity -= 0.05;
        audio_play_sound(snd_equip_mobile, 0, false);
    }
    else
    {
        audio_play_sound(snd_hurt_mobile, 0, false);
    }
}

if (device_mouse_x_to_gui(0) >= 531.5 && device_mouse_y_to_gui(0) >= 213 && device_mouse_x_to_gui(0) <= 561.5 && device_mouse_y_to_gui(0) <= 231 && mouse_check_button_pressed(mb_left))
{
    if (controls_opacity < 1)
    {
        controls_opacity += 0.05;
        audio_play_sound(snd_coin_mobile, 0, false);
    }
    else
    {
        audio_play_sound(snd_hurt_mobile, 0, false);
    }
}

if (device_mouse_x_to_gui(0) >= 241 && device_mouse_y_to_gui(0) >= 412.25 && device_mouse_x_to_gui(0) <= 399 && device_mouse_y_to_gui(0) <= 436.25 && mouse_check_button_pressed(mb_left))
{
    audio_play_sound(snd_noise_mobile, 0, false);
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
    joystick_type = 0;
    controls_opacity = 0.5;
}
