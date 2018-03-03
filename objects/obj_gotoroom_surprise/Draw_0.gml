/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x,y,obj_player) && flag == true || gotoroomsignal == true)
{
	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);
	var width = _vx + camera_get_view_width(view_camera[0]);
	var height = _vy + camera_get_view_height(view_camera[0]);

	draw_set_color(c_black);
	draw_set_alpha(step/time);
	draw_rectangle(_vx,_vy,width,height,false);
	draw_set_alpha(1);

	if((step/time) >= 1)
	{
		gotoroomsignal = false;
		room_goto(next_room);
	}
	step++;
}
else
{
	step = 0;
}

if(!place_meeting(x,y,obj_player))
{
	flag = true;
}
