/// @description change player sprite and etc
if(place_meeting(x,y+2,obj_wall))
{
	is_surface = true;
}
if(is_surface == true)
{
	sprite_index = spr_rope_surface;
}

if(place_meeting(x,y,obj_player) && obj_player.is_up && !obj_player.key_jump)
{
	obj_player.x = x;
}
if(place_meeting(x,y+16,obj_wall))
{
	instance_destroy();
}
