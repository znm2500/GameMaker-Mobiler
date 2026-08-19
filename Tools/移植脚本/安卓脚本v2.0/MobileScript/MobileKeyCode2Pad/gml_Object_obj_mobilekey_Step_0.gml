if (keyboard_check_pressed(mk_up_left_button))
{
    if (global.mubai == 0)
    {
        global.mubai = 1;
        audio_play_sound(snd_save_sup, 0, false);
    }
    else if (global.mubai == 1)
    {
        global.mubai = 0;
        audio_play_sound(snd_item_equip_mobile, 0, false);
    }
    
    ini_open("MobileFile.ini");
    ini_write_string("MobileKey", "Touch", global.mubai);
    ini_close();
}

if (global.mubai == 0)
{
    cu = 1;
    cd = 1;
    cl = 1;
    cr = 1;
    cz = 1;
    cx = 1;
    cg = 1;
    _m = 0;
    mubai = 1;
    
    for (var i = 0; i < 4; i++)
    {
        var _ak = 0;
        var _ak2 = 0;
        
        if (device_mouse_check_button(i, mb_left))
        {
            if (device_mouse_x_to_gui(i) >= 560)
            {
                cz = 0.5;
                _ak = mk_z_button;
            }
            else if (device_mouse_x_to_gui(i) >= 480)
            {
                cx = 0.5;
                _ak = mk_x_button;
            }
            else if (device_mouse_x_to_gui(i) >= 400)
            {
                cg = 0.5;
                _ak = mk_c_button;
            }
            else if (device_mouse_x_to_gui(i) <= 80 && device_mouse_x_to_gui(i) >= 0 && device_mouse_y_to_gui(i) <= 50)
            {
                mubai = 0.5;
                _ak = mk_up_left_button;
            }
            else if (!_m)
            {
                if (device_mouse_x_to_gui(i) < 400)
                {
                    _m = 1;
                    var _dx = device_mouse_x_to_gui(i) - 140;
                    var _dy = device_mouse_y_to_gui(i) - 360;
                    var _da = point_direction(0, 0, _dx, _dy);
                    
                    if (_da >= 292.5 || _da <= 67.5)
                    {
                        cr = 0.5;
                        
                        if (_ak == 0)
                            _ak = mk_right;
                        else
                            _ak2 = mk_right;
                    }
                    
                    if (_da >= 22.5 && _da <= 157.5)
                    {
                        cu = 0.5;
                        
                        if (_ak == 0)
                            _ak = mk_up;
                        else
                            _ak2 = mk_up;
                    }
                    
                    if (_da >= 112.5 && _da <= 247.5)
                    {
                        cl = 0.5;
                        
                        if (_ak == 0)
                            _ak = mk_left;
                        else
                            _ak2 = mk_left;
                    }
                    
                    if (_da >= 202.5 && _da <= 337.5)
                    {
                        cd = 0.5;
                        
                        if (_ak == 0)
                            _ak = mk_down;
                        else
                            _ak2 = mk_down;
                    }
                }
            }
        }
        
        if (device_mouse_check_button_pressed(i, mb_left))
        {
            if (_ak != 0)
            {
                if (keyboard_check(_ak))
                {
                    keyboard_key_release(_ak);
                    keyboard_key_press(_ak);
                }
            }
            
            if (_ak2 != 0)
            {
                if (keyboard_check(_ak2))
                {
                    keyboard_key_release(_ak2);
                    keyboard_key_press(_ak2);
                }
            }
        }
    }
    
    if (mubai == 0.5 && !keyboard_check(mk_up_left_button))
        keyboard_key_press(mk_up_left_button);
    
    if (cz == 0.5 && !keyboard_check(mk_z_button))
        keyboard_key_press(mk_z_button);
    
    if (cx == 0.5 && !keyboard_check(mk_x_button))
        keyboard_key_press(mk_x_button);
    
    if (cg == 0.5 && !keyboard_check(mk_c_button))
        keyboard_key_press(mk_c_button);
    
    if (cr == 0.5 && !keyboard_check(mk_right))
        keyboard_key_press(mk_right);
    
    if (cu == 0.5 && !keyboard_check(mk_up))
        keyboard_key_press(mk_up);
    
    if (cl == 0.5 && !keyboard_check(mk_left))
        keyboard_key_press(mk_left);
    
    if (cd == 0.5 && !keyboard_check(mk_down))
        keyboard_key_press(mk_down);
    
    if (mubai == 1 && keyboard_check(mk_up_left_button))
        keyboard_key_release(mk_up_left_button);
    
    if (cz == 1 && keyboard_check(mk_z_button))
        keyboard_key_release(mk_z_button);
    
    if (cx == 1 && keyboard_check(mk_x_button))
        keyboard_key_release(mk_x_button);
    
    if (cg == 1 && keyboard_check(mk_c_button))
        keyboard_key_release(mk_c_button);
    
    if (cr == 1 && keyboard_check(mk_right))
        keyboard_key_release(mk_right);
    
    if (cu == 1 && keyboard_check(mk_up))
        keyboard_key_release(mk_up);
    
    if (cl == 1 && keyboard_check(mk_left))
        keyboard_key_release(mk_left);
    
    if (cd == 1 && keyboard_check(mk_down))
        keyboard_key_release(mk_down);
}

if (global.mubai == 1)
{
    cu = 1;
    cd = 1;
    cl = 1;
    cr = 1;
    cz = 1;
    cx = 1;
    cg = 1;
    cw = 1;
    ca = 1;
    cs = 1;
    cd_d = 1;
    mubai = 1;
    
    for (var i = 0; i < 4; i++)
    {
        var _ak = 0;
        var _ak2 = 0;
        var _entered_left = 0;
        var _entered_right = 0;
        
        if (device_mouse_check_button(i, mb_left))
        {
            var _mx = device_mouse_x_to_gui(i);
            var _my = device_mouse_y_to_gui(i);
            
            if (_my < 50 && _mx >= 320 && _mx < 640)
            {
                if (_mx >= 560)
                {
                    cz = 0.5;
                    _ak = mk_z_button;
                }
                else if (_mx >= 480)
                {
                    cx = 0.5;
                    _ak = mk_x_button;
                }
                else if (_mx >= 400)
                {
                    cg = 0.5;
                    _ak = mk_c_button;
                }
            }
            else if (_mx <= 80 && _mx >= 0 && _my <= 50)
            {
                mubai = 0.5;
                _ak = mk_up_left_button;
            }
            else if (_mx < 320 && !_entered_left && !_entered_right)
            {
                _entered_left = 1;
                var _dx = _mx - 140;
                var _dy = _my - 360;
                var _da = point_direction(0, 0, _dx, _dy);
                
                if (_da >= 292.5 || _da <= 67.5)
                {
                    cr = 0.5;
                    
                    if (_ak == 0)
                        _ak = mk_two_right;
                    else
                        _ak2 = mk_two_right;
                }
                
                if (_da >= 22.5 && _da <= 157.5)
                {
                    cu = 0.5;
                    
                    if (_ak == 0)
                        _ak = mk_two_up;
                    else
                        _ak2 = mk_two_up;
                }
                
                if (_da >= 112.5 && _da <= 247.5)
                {
                    cl = 0.5;
                    
                    if (_ak == 0)
                        _ak = mk_two_left;
                    else
                        _ak2 = mk_two_left;
                }
                
                if (_da >= 202.5 && _da <= 337.5)
                {
                    cd = 0.5;
                    
                    if (_ak == 0)
                        _ak = mk_two_down;
                    else
                        _ak2 = mk_two_down;
                }
            }
            else if (_mx >= 320 && !_entered_left && !_entered_right)
            {
                _entered_right = 1;
                var _dx_right = _mx - 500;
                var _dy_right = _my - 360;
                var _da_right = point_direction(0, 0, _dx_right, _dy_right);
                mk_two_w = 87;
                mk_two_a = 65;
                mk_two_s = 83;
                mk_two_d = 68;
                
                if (_da_right >= 292.5 || _da_right <= 67.5)
                {
                    cd_d = 0.5;
                    
                    if (_ak == 0)
                        _ak = mk_two_d;
                    else
                        _ak2 = mk_two_d;
                }
                
                if (_da_right >= 22.5 && _da_right <= 157.5)
                {
                    cw = 0.5;
                    
                    if (_ak == 0)
                        _ak = mk_two_w;
                    else
                        _ak2 = mk_two_w;
                }
                
                if (_da_right >= 112.5 && _da_right <= 247.5)
                {
                    ca = 0.5;
                    
                    if (_ak == 0)
                        _ak = mk_two_a;
                    else
                        _ak2 = mk_two_a;
                }
                
                if (_da_right >= 202.5 && _da_right <= 337.5)
                {
                    cs = 0.5;
                    
                    if (_ak == 0)
                        _ak = mk_two_s;
                    else
                        _ak2 = mk_two_s;
                }
            }
        }
        
        if (device_mouse_check_button_pressed(i, mb_left))
        {
            if (_ak != 0)
            {
                if (keyboard_check(_ak))
                {
                    keyboard_key_release(_ak);
                    keyboard_key_press(_ak);
                }
            }
            
            if (_ak2 != 0)
            {
                if (keyboard_check(_ak2))
                {
                    keyboard_key_release(_ak2);
                    keyboard_key_press(_ak2);
                }
            }
        }
    }
    
    if (cz == 0.5 && !keyboard_check(mk_z_button))
        keyboard_key_press(mk_z_button);
    
    if (cx == 0.5 && !keyboard_check(mk_x_button))
        keyboard_key_press(mk_x_button);
    
    if (cg == 0.5 && !keyboard_check(mk_c_button))
        keyboard_key_press(mk_c_button);
    
    if (cr == 0.5 && !keyboard_check(mk_two_right))
        keyboard_key_press(mk_two_right);
    
    if (cu == 0.5 && !keyboard_check(mk_two_up))
        keyboard_key_press(mk_two_up);
    
    if (cl == 0.5 && !keyboard_check(mk_two_left))
        keyboard_key_press(mk_two_left);
    
    if (cd == 0.5 && !keyboard_check(mk_two_down))
        keyboard_key_press(mk_two_down);
    
    if (cw == 0.5 && !keyboard_check(mk_two_w))
        keyboard_key_press(mk_two_w);
    
    if (ca == 0.5 && !keyboard_check(mk_two_a))
        keyboard_key_press(mk_two_a);
    
    if (cs == 0.5 && !keyboard_check(mk_two_s))
        keyboard_key_press(mk_two_s);
    
    if (cd_d == 0.5 && !keyboard_check(mk_two_d))
        keyboard_key_press(mk_two_d);
    
    if (cz == 1 && keyboard_check(mk_z_button))
        keyboard_key_release(mk_z_button);
    
    if (cx == 1 && keyboard_check(mk_x_button))
        keyboard_key_release(mk_x_button);
    
    if (cg == 1 && keyboard_check(mk_c_button))
        keyboard_key_release(mk_c_button);
    
    if (cr == 1 && keyboard_check(mk_two_right))
        keyboard_key_release(mk_two_right);
    
    if (cu == 1 && keyboard_check(mk_two_up))
        keyboard_key_release(mk_two_up);
    
    if (cl == 1 && keyboard_check(mk_two_left))
        keyboard_key_release(mk_two_left);
    
    if (cd == 1 && keyboard_check(mk_two_down))
        keyboard_key_release(mk_two_down);
    
    if (cw == 1 && keyboard_check(mk_two_w))
        keyboard_key_release(mk_two_w);
    
    if (ca == 1 && keyboard_check(mk_two_a))
        keyboard_key_release(mk_two_a);
    
    if (cs == 1 && keyboard_check(mk_two_s))
        keyboard_key_release(mk_two_s);
    
    if (cd_d == 1 && keyboard_check(mk_two_d))
        keyboard_key_release(mk_two_d);
    
    if (mubai == 0.5 && !keyboard_check(mk_up_left_button))
        keyboard_key_press(mk_up_left_button);
    
    if (mubai == 1 && keyboard_check(mk_up_left_button))
        keyboard_key_release(mk_up_left_button);
}
