/// @draw_arrow
draw_self();
if(link_obj == noone)
{
	draw_set_color(c_red);
	draw_line_width(x,y,obj_mouse.x,obj_mouse.y,2);
}
else
{
	if(instance_exists(link_obj))
		draw_line(x,y,link_obj.x,link_obj.y);
}