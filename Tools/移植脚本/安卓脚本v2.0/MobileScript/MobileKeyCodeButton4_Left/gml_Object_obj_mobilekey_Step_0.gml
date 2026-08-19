cu = 1;
cd = 1;
cl = 1;
cr = 1;
cz = 1;
cx = 1;
cg = 1;
_m = 0;
mubai = 1;

for (i = 0; i < 4; i++)
{
    _ak = 0;
    _ak2 = 0;
    
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
                _dx = device_mouse_x_to_gui(i) - 140;
                _dy = device_mouse_y_to_gui(i) - 360;
                _da = point_direction(0, 0, _dx, _dy);
                
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
