/// @description Insert description here
// You can write your code in this editor
init_state = state;
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
	if(instance_exists(new_water))
	{
		new_water.frozensignal = true;
	}
}
else
{
	if(instance_exists(new_water))
	{
		new_water.frozensignal = false;
	}
}

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
		prev_obj = other_id;
		state -= round(other_id.intense);
		flag = true;
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
if(state < 1 && wall_id == noone)
{
	wall_id = instance_create_layer(x,y,"layer_wall",obj_wall);
	wall_id.image_xscale = self.sprite_height/wall_id.sprite_height;
	wall_id.image_yscale = self.sprite_width/wall_id.sprite_width;
}
if(state >= 1 && wall_id != noone)
{
	instance_destroy(wall_id);
	wall_id = noone;
}

if(!instance_place(x,y-2,obj_water))
{
	is_surface = true;
}
else
	is_surface = false;
	
if(!instance_place(x,y+32,obj_wall) && !instance_place(x,y+32,obj_water) && sprite_index != spr_water_solid && !place_meeting(x,y,obj_wall))
{
	is_flow = true;
}
else
{
	if(new_water != noone && sprite_index == spr_water_solid)
		is_flow = true;
	else
		is_flow = false;
}

if(is_flow == true && new_water == noone)
{
	new_water = instance_create_layer(x,y+32,"layer_water",obj_water_flow);
	new_water.master = id;
}
if(is_flow == false && new_water != noone)
{
	if(new_water != noone && state < 1)
		new_water.frozensignal = true;
	if(new_water.frozensignal == false)
	{
		new_water.killsignal = true;
		new_water = noone;
	}
}


if(init_state != state || statesignal == true)
{
	if(place_meeting(x+1,y,obj_water))
	{
		var _id = instance_place(x+1,y,obj_water);
		_id.state = state;
		_id.init_state = state;
	}
	if(place_meeting(x,y+1,obj_water))
	{
		var _id;
		_id = instance_place(x,y+1,obj_water);
		_id.state = state;
		_id.init_state = state;
	}
	if(place_meeting(x-1,y,obj_water))
	{
		var _id;
		_id = instance_place(x-1,y,obj_water);
		_id.state = state;
		_id.init_state = state;
	}
	if(place_meeting(x,y-1,obj_water))
	{
		var _id;
		_id = instance_place(x,y-1,obj_water);
		_id.state = state;
		_id.init_state = state;
	}
	statesignal = false;
}
if(is_surface == false)
{
	if(obj_player.vspd > 10)
	{
		obj_player.vspd = 10;
	}
}
	
	
	
	
	
	
	
	
	
