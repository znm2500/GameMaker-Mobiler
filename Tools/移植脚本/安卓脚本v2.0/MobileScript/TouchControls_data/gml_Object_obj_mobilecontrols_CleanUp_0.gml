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

if (global.Android_System_Keyboard == 1)
    virtual_key_delete(virtual_key_keyboard);

virtual_key_delete(virtual_key_zp);
virtual_key_delete(virtual_key_xp);
virtual_key_delete(virtual_key_cp);
virtual_key_delete(virtual_key_analog);
virtual_key_delete(virtual_key_analogp);
virtual_key_delete(virtual_key_settings);
