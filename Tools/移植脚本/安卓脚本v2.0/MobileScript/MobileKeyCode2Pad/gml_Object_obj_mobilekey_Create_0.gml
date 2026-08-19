cu = 1;
cd = 1;
cl = 1;
cr = 1;
cz = 1;
cx = 1;
cg = 1;
mubai = 1;
rainbow = 0;
cw = 1;
ca = 1;
cs = 1;
cd_d = 1;
mk_z_button = ord("Z");
mk_z_color = c_aqua;
mk_x_button = ord("X");
mk_x_color = c_orange;
mk_c_button = ord("C");
mk_c_color = c_green;
mk_up_left_button = vk_numpad9;
mk_up_left_color = c_blue;
mk_up = vk_up;
mk_down = vk_down;
mk_right = vk_right;
mk_left = vk_left;
mk_two_up = vk_up;
mk_two_down = vk_down;
mk_two_right = vk_right;
mk_two_left = vk_left;
mk_two_w = ord("W");
mk_two_a = ord("A");
mk_two_s = ord("S");
mk_two_d = ord("D");
mk_button_alpha = 0.5;

if (global.mobile_prioritize_display == 1)
    depth = -16000;

if (global.mobile_prioritize_display == 2)
    depth = -infinity;

ini_open("MobileFile.ini");
global.mubai = ini_read_string("MobileKey", "Touch", 0);
ini_close();
