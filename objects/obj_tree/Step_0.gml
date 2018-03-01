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
	instance_destroy();
}
if(state >= 3 || state < 2)
{

}

if(!place_meeting(x,y,obj_water_flow))
{
if(place_meeting(x,y,obj_cold) && place_meeting(x,y,obj_hot))
{
	obj_cold.flag = false;
	obj_hot.flag = false;
	obj_cold.master_flag = false;
	obj_hot.master_flag = false;
}
if(place_meeting(x,y,obj_cold) && obj_cold.flag == true)
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
if(place_meeting(x,y,obj_hot) && obj_hot.flag == true)
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
}
else if(place_meeting(x,y,obj_hot) || place_meeting(x,y,obj_cold))
{
	if(instance_exists(obj_hot))
		obj_hot.master_flag = false;
	if(instance_exists(obj_cold))
		obj_cold.master_flag = false;
}
if(place_meeting(x,y-1,obj_wood))
{
	instance_destroy();
}
