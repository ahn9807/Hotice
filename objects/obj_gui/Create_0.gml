/// @description init draw_interface
icon_dis = 40;

heart = 6;
heart_speed = room_speed/2;
heart_index = 0;
heart_timer = 0;

time_ms =0;
time_s =0;
time_m =0;

gui_num = 2;
gui_sep = 12;

paper_num = instance_number(obj_paper);
diction = array_create(paper_num,-1);
count = paper_num;