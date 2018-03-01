/// @description Insert description here
// You can write your code in this editor
prev_move = hspd;

if(state <= 0)
{
	state = 0;
}
if(state >= 3)
{
	state = 3;
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
}
else if(place_meeting(x,y,obj_hot) || place_meeting(x,y,obj_cold))
{
	if(instance_exists(obj_hot))
		obj_hot.master_flag = false;
	if(instance_exists(obj_cold))
		obj_cold.master_flag = false;
}


if((place_meeting(x-1,y,obj_player) || place_meeting(x+1,y,obj_player)) && sprite_index != spr_wood_frozen)
{
	if(obj_player.key_push)
	{
		var move = -obj_player.key_left + obj_player.key_right;
		if(obj_player.key_dash)
		{
			hspd = move*obj_player.movespd*2;
		}
		else
		{
			hspd = move*obj_player.movespd;
		}
		
		if(abs(obj_player.y-y)>128)
			hspd = 0;
	}
	else
		hspd = 0;
}
else
	hspd = 0;
vspd += grav;

//collision with ice
if(place_meeting(x,y+1,obj_water) && prev_move != 0 && hspd == 0)
{
	var _id = scr_touch_id(obj_water);
	if(_id.sprite_index == spr_water_solid)
	{
		hspd = prev_move;
	}
}
//horizontal collision
if(place_meeting(x+hspd,y,obj_wall))
{
	while(!place_meeting(x+sign(hspd),y,obj_wall))
	{
		x +=sign(hspd);
	}	
	hspd = 0; 
}
//vertical collision
if(place_meeting(x,y+vspd,obj_wall))
{
	while(!place_meeting(x,y+sign(vspd),obj_wall))
	{
		y +=sign(vspd);
	}
	vspd = 0;
}
//horizontal collision
if(place_meeting(x+hspd,y,obj_player))
{
	while(!place_meeting(x+sign(hspd),y,obj_player))
	{
		x +=sign(hspd);
	}	
	hspd = 0; 
}
//vertical collision
if(place_meeting(x,y+vspd,obj_player))
{
	while(!place_meeting(x,y+sign(vspd),obj_player))
	{
		y +=sign(vspd);
	}
	vspd = 0;
}
//horizontal collision
if(place_meeting(x+hspd,y,obj_tree))
{
	while(!place_meeting(x+sign(hspd),y,obj_tree))
	{
		x +=sign(hspd);
	}	
	hspd = 0; 
}
//vertical collision
if(place_meeting(x,y+vspd,obj_tree))
{
	while(!place_meeting(x,y+sign(vspd),obj_tree))
	{
		y +=sign(vspd);
	}
	vspd = 0;
}
if(sprite_index == spr_wood_frozen)
{
	hspd = 0;
	vspd = 0;
}


x += hspd;
y += vspd;