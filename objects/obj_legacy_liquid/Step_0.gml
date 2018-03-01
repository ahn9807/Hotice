/// @description interact with cold and hot
physics_particle_delete_region_box(room_width+32,room_height,320,32);

/// @description changing state
if(state <= 0)
{
	state = 0;
}
if(state >= 3)
{
	state = 3;
}

if(state < 1)
{
	sprite_index = spr_tree_frozen;
}
else if(1<=state && state<2)
{
	sprite_index = spr_tree_noting;
}
else if(2<=state && state <3)
{
	sprite_index = spr_tree_fire;
}
else
{
	sprite_index = spr_tree_ashes;
}

if(place_meeting(x,y,obj_cold))
{
	other_id = obj_cold.id;
	if(other_id != prev_obj)
	{
		flag = false;
	}
	if(other_id.link_obj != noone && flag == false)
	{
		if(sprite_index == spr_tree_noting || sprite_index == spr_tree_fire)
		{
			prev_obj = other_id;
			state -= round(other_id.intense);
			flag = true;
		}
	}
}
if(place_meeting(x,y,obj_hot))
{
	other_id = obj_hot.id;
	if(other_id != prev_obj)
	{
		flag = false;
	}
	if(other_id.link_obj != noone && flag == false)
	{
		prev_obj = other_id;
		state += round(other_id.intense);
		flag = true;
	}
}
