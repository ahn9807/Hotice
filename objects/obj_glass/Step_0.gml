
/// @description changing state

if(broken_level < 1)
{
	sprite_index = spr_glass_normal;
}
else if(broken_level < 2)
{
	sprite_index = spr_glass_broken_1;
}
else if(broken_level < 3)
{
	sprite_index = spr_glass_broken_2
}
else if(broken_level < 4)
{
	sprite_index = spr_glass_broken_3;
}
else if(broken_level < 5)
{
	sprite_index = spr_glass_broken_4;
}
else
{
	instance_destroy();
}

if(place_meeting(x-1,y,obj_player) || place_meeting(x+1,y,obj_player))
{
	if(obj_player.sprite_index == spr_player_attack_left || obj_player.sprite_index == spr_player_attack_right)
	{
		broken_level = broken_level + 2/room_speed;
	}
}

