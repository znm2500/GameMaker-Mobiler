if (global.ui_state == 1)
{
    if (global.add_mobilekey == 1)
    {
        global.ui_state = 2;
        audio_play_sound(snd_save_sup, 0, false);
        instance_create_depth(0, 0, 0, obj_mobilekey);
    }
    else
    {
        global.ui_state = 3;
        audio_play_sound(snd_save_sup, 0, false);
        instance_create_depth(0, 0, 0, obj_mobilecontrols);
        instance_destroy(obj_mobilekey);
        
        with (obj_mobilecontrols)
            scr_add_keys();
    }
}
else if (global.ui_state == 2)
{
    global.ui_state = 3;
    audio_play_sound(snd_mercyadd_mobile, 0, false);
    instance_create_depth(0, 0, 0, obj_mobilecontrols);
    instance_destroy(obj_mobilekey);
    
    with (obj_mobilecontrols)
        scr_add_keys();
}
else if (global.ui_state == 3)
{
    global.ui_state = 4;
    
    if (global.add_mobilekey == 1)
        audio_play_sound(snd_noise_mobile, 0, false);
    else
        audio_play_sound(snd_mercyadd_mobile, 0, false);
    
    instance_create_depth(0, 0, 0, obj_mobilecontrols_button);
    instance_destroy(obj_mobilecontrols);
    
    with (obj_mobilecontrols_button)
        scr_add_keys_button();
}
else if (global.ui_state == 4)
{
    global.ui_state = 1;
    audio_play_sound(snd_item_equip_mobile, 0, false);
    instance_destroy(obj_mobilecontrols_button);
}

ini_open("mobile_config.ini");
ini_write_real("UI", "state", global.ui_state);
ini_close();
