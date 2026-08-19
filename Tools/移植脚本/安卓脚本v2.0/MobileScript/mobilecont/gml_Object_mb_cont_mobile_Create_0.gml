//0为否，1为是
global.ui_state = 1;
global.mobile_f2 = 1;
//Joystick重开键是否开启
global.mobile_heal = 0;
//Joystick回血键是否开启
global.mobile_cn = 1;
//Joystick设置选项是否中文
global.mobile_prioritize_display = 0;
//键盘显示优先级
//1深度-16000
//2深度-无限
global.mobile_room_speed_keep_60 = 0;
//强制给游戏设定为60帧
global.add_mobilekey = 1;
//添加mobilekey
global.Android_System_Keyboard = 0;
//添加系统键盘

if (asset_get_index("font_mubai") >= 0)
    global.joystick_font = asset_get_index("font_mubai");
else
    global.joystick_font = 0;

ini_open("mobile_config.ini");
global.ui_state = ini_read_real("UI", "state", 1);
ini_close();

if (global.ui_state == 2)
    instance_create_depth(0, 0, 0, obj_mobilekey);
else if (global.ui_state == 3)
    instance_create_depth(0, 0, 0, obj_mobilecontrols);
else if (global.ui_state == 4)
    instance_create_depth(0, 0, 0, obj_mobilecontrols_button);
