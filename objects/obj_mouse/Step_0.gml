/// @show mouse movement
x = clamp(mouse_x,camera_get_view_x(view_camera[0]),camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]));
y = clamp(mouse_y,camera_get_view_y(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]));

if(mouse_mode == 2)
{
	sprite_index = spr_mouse;
}
else if(mouse_mode == 1)
{
	sprite_index = spr_mouse;
}


