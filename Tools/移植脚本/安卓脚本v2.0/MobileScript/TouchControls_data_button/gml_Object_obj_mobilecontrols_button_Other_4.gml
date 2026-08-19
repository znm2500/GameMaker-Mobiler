if (instance_exists(obj_mobilecontrols_button))
{
    virtual_key_zp = virtual_key_add(zx, zy, 27 * button_scale, 29 * button_scale, 125);
    virtual_key_xp = virtual_key_add(xx, xy, 27 * button_scale, 29 * button_scale, 124);
    virtual_key_cp = virtual_key_add(cx, cy, 27 * button_scale, 29 * button_scale, 94);
    virtual_key_upp = virtual_key_add(upx, upy, 27 * analog_scale, 29 * analog_scale, 97);
    virtual_key_downp = virtual_key_add(downx, downy, 27 * analog_scale, 29 * analog_scale, 98);
    virtual_key_leftp = virtual_key_add(leftx, lefty, 27 * analog_scale, 29 * analog_scale, 99);
    virtual_key_rightp = virtual_key_add(rightx, righty, 27 * analog_scale, 29 * analog_scale, 100);
    
    if (global.mobile_heal == 1)
        virtual_key_hp = virtual_key_add(hx, hy, 27 * button_scale, 29 * button_scale, 96);
    
    if (global.mobile_f2 == 1)
        virtual_key_restartp = virtual_key_add(f2x, f2y, 27 * button_scale, 29 * button_scale, 101);
    
    if (global.Android_System_Keyboard == 1)
        virtual_key_keyboard = virtual_key_add(keyboardx, keyboardy, 38, 50, 105);
    
    virtual_key_settings = virtual_key_add(-50, 5, 38, 50, 92);
    
    if (edit != 0)
        exit;
    
    virtual_key_z = virtual_key_add(zx, zy, 27 * button_scale, 29 * button_scale, 90);
    virtual_key_x = virtual_key_add(xx, xy, 27 * button_scale, 29 * button_scale, 88);
    virtual_key_c = virtual_key_add(cx, cy, 27 * button_scale, 29 * button_scale, 67);
    
    if (global.mobile_f2 == 1)
        virtual_key_restart = virtual_key_add(f2x, f2y, 27 * button_scale, 29 * button_scale, 113);
    
    if (global.mobile_heal == 1)
        virtual_key_h = virtual_key_add(hx, hy, 27 * button_scale, 29 * button_scale, 72);
    
    virtual_key_up = virtual_key_add(upx, upy, 27 * analog_scale, 29 * analog_scale, 38);
    virtual_key_down = virtual_key_add(downx, downy, 27 * analog_scale, 29 * analog_scale, 40);
    virtual_key_left = virtual_key_add(leftx, lefty, 27 * analog_scale, 29 * analog_scale, 37);
    virtual_key_right = virtual_key_add(rightx, righty, 27 * analog_scale, 29 * analog_scale, 39);
}
