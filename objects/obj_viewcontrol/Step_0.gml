/// @description Insert description here
// You can write your code in this editor

//moving camera
if(set_camera == true)
{
	camera_set_view_size(view_camera[0],1920,1080);
	set_camera = false;
}

var _wcam = camera_get_view_width(view_camera[0]);
var _hcam = camera_get_view_height(view_camera[0]);

if(keyboard_check_pressed(ord("E")))
{
	if(follow_mode == obj_player)
		follow_mode = obj_mouse;
	else
		follow_mode = obj_player;
}

if(follow_mode == obj_player && obj_mouse.mouse_mode != 2)
{
	camera_set_view_target(view_camera[0],obj_player);
	camera_set_view_border(view_camera[0],_wcam/2,_hcam/2)
}
else if(obj_mouse.mouse_mode == 1)
{
	camera_set_view_border(view_camera[0],25,25);
	camera_set_view_target(view_camera[0],obj_mouse);
}
else
{
	camera_set_view_border(view_camera[0],0,0);
	camera_set_view_target(view_camera[0],obj_mouse);
}



//background moving
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);


if(back_1_spd != -1)
{
	layer_x("background_1", _cam_x * back_1_spd); 
	layer_y("background_1", _cam_y * back_1_spd); 
}
if(back_2_spd != -1)
{
	layer_x("background_2", _cam_x * back_2_spd); 
	layer_y("background_2", _cam_y * back_2_spd); 
}
if(back_3_spd != -1)
{
	layer_x("background_3", _cam_x * back_3_spd); 
	layer_y("background_3", _cam_y * back_3_spd); 
}
if(back_4_spd != -1)
{
	layer_x("background_4", _cam_x * back_4_spd); 
	layer_y("background_4", _cam_y * back_4_spd); 
}
if(back_5_spd != -1)
{
	layer_x("background_5", _cam_x * back_5_spd); 
	layer_y("background_5", _cam_y * back_5_spd); 
}
