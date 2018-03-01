/// @description Insert description here
// You can write your code in this editor
switch(position)
{
	case up:
	{
		sprite_index = spr_spike_up;
		break;
	}
	case down:
	{
		sprite_index = spr_spike_down;
		break;
	}
	case left:
	{
		sprite_index = spr_spike_left;
		break;
	}
	case right:
	{
		sprite_index = spr_spike_right;
		break;
	}
}

if(scr_touch(obj_player))
{
	obj_player.heart -= damage;
}