/// @description Insert description here
// You can write your code in this editor
/// @description draw gui


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////draw heart////////////////////////////////////////
var space =0;
var full_count = 0;
var half_count = 0;
if(round(heart)%2 == 0)
{
	space = abs(round(heart)/2);
	half_count = 0;
	full_count = round(heart)/2;
}
else
{
	space = abs(round(heart)/2 + 0.5);
	half_count = 1;
	full_count = round(heart)/2 - 0.5;
}

for(var i=0;i<full_count;i++)
{
	draw_sprite_ext(spr_heart_full,heart_index,window_get_width()-space*icon_dis+i*icon_dis,72,0.5,0.5,0,c_white,1);
}
if(half_count == 1)
{
	draw_sprite_ext(spr_heart_half,heart_index,window_get_width()-icon_dis,72,0.5,0.5,0,c_white,1);
}
if(heart_timer <= heart_speed)
{
	heart_timer ++;
}
else
{
	if(heart_index == 1)
		heart_index = 0;
	else
		heart_index = 1;
	heart_timer = 0;
}

////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////draw gui////////////////////////////////////////
var wx=device_mouse_x_to_gui(0);
var wy=device_mouse_y_to_gui(0);

if(point_in_rectangle(wx,wy,30,30,104,104) && mouse_check_button_pressed(mb_left))
{
    
}
else
{
	draw_sprite(spr_menu,0,72,72); 
}
if(point_in_rectangle(wx,wy,30+64,30,104+64,104) && mouse_check_button_pressed(mb_left))
{
	if(mouse_check_button_pressed(mb_left))
	{
		obj_room_init.restart = true;
	}	   
}
else
{
	draw_sprite(spr_restart,0,72+64,72); 
}
if(point_in_rectangle(wx,wy,30+128,30,104+128,104) && mouse_check_button_pressed(mb_left))
{

}
else
{
//	draw_sprite(spr_book,0,72+128,72); 
}




////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////draw remain paper to gain///////////////////////////////////////////////////////////
var size = sprite_get_width(spr_paper_index);
var xx = (window_get_width() - paper_num*(size))/2;
var yy = 72;
var is_meet = false;
var is_who = noone;
with(obj_player)
{
	is_meet = place_meeting(x,y,obj_paper);
	is_who = instance_place(x,y,obj_paper);
}
{
	if(is_meet)
	{
		for(var i=0;i<paper_num;i++)
		{
			if(diction[i] == is_who)
			{
				break;
			}
			if(diction[i] == -1)
			{
				diction[i] = is_who;
				break;
			}
		}
		if(paper_num - (i+1) < count)
			count = paper_num - (i+1);
	}
}

for(var i=0;i<paper_num - count;i++)
{
	draw_sprite(spr_paper_index,0,xx+size*i,yy);
}
for(var i=paper_num - count;i<paper_num;i++)
{
	draw_sprite_ext(spr_paper_index,0,xx+size*i,yy,1,1,0,c_black,0.5);
}





















