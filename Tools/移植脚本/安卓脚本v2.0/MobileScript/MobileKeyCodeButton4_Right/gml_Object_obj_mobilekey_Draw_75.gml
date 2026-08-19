draw_set_alpha(mk_button_alpha);
draw_roundrect_color(400, 460, 480, 480, mk_c_color, mk_c_color, 0);
draw_roundrect_color(480, 420, 560, 460, mk_x_color, mk_x_color, 0);
draw_roundrect_color(560, 420, 640, 460, mk_z_color, mk_z_color, 0);
draw_roundrect_color(560, 0, 640, 30, mk_up_right_color, mk_up_right_color, 0);
draw_set_alpha(1);
draw_sprite_ext(spr_mobilekey, 0, 76, 296, 2, 2, 0, c_white, 0.41);
