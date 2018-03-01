/// @description Insert description here
// You can write your code in this editor
///Get the player's input


////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////DRAW_SPRITE AND MOVING PLAYER////////////////////////////////
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(vk_space);
key_dash = keyboard_check(vk_shift);
key_attack = keyboard_check(ord("Z"));
key_push = keyboard_check(ord("X"));

prev_move = hspd;
//React to input
var move = -key_left + key_right;
if(key_dash)
	hspd = move*movespd*2;
else
	hspd = move*movespd;
	
vspd += grav;
init_vspd = vspd;

//calculating position;
if(hspd > 0)
	position = RIGHT;
if(hspd < 0)
	position = LEFT;
	
	
	
//control player object sprite
//if(!key_jump && place_meeting(x,y+1,obj_wall)) //for not sticking to wall
{
	if(position == 0)
		sprite_index = spr_player_front;
	if(position == LEFT)
	{
		if(key_dash)
		{
			sprite_index = spr_player_running_left;
		}
		else if(hspd != 0)
		{
			sprite_index = spr_player_walking_left;
		}
		
		if(key_attack)
		{
			sprite_index = spr_player_attack_left;
			hspd = 0;
		}
		
		if(key_push && key_dash == 0 && key_left != 0)
		{	
			if(sprite_index = spr_player_walking_left && junho_flag != true)
				junho_flag = true;
			else
				sprite_index = spr_player_walking_left;
			if(junho_flag == true)
				sprite_index = spr_player_bow_left;
		}
		if(key_push && key_dash == 1 && key_left != 0)
		{
			if(sprite_index == spr_player_running_left && junho_flag != true)
				junho_flag = true;
			else
				sprite_index = spr_player_running_left;
			if(junho_flag == true)
			{
				sprite_index = spr_player_forward_left;
			}
		}

		
		if(hspd == 0 && key_attack == false && key_push == 0)
		{
			sprite_index = spr_player_standing_left;
			junho_flag = false;
		}
	}
	
	if(position == RIGHT)
	{
		if(key_dash)
		{
			sprite_index = spr_player_running_right;
		}
		else if(hspd != 0)
		{
			sprite_index = spr_player_walking_right;
		}
		
		if(key_attack)
		{
			sprite_index = spr_player_attack_right;
			hspd = 0;
		}
		
		if(key_push && key_dash == 0 && key_right != 0)
		{
			if(sprite_index == spr_player_walking_right && junho_flag != true)
				junho_flag = true;
			else
				sprite_index = spr_player_walking_right;
			if(junho_flag == true)
				sprite_index = spr_player_bow_right;
		}
		if(key_push && key_dash == 1 && key_right != 0 && junho_flag != true)
		{
			if(sprite_index == spr_player_running_right)
				junho_flag = true;
			else
				sprite_index = spr_player_running_right;
			if(junho_flag == true)
			{
				sprite_index = spr_player_forward_right;
			}
		}

		
		if(hspd == 0 && key_attack == false && key_push == 0)
		{
			sprite_index = spr_player_standing_right;
			junho_flag = false;
		}
	}
}

//when player is on the ice
if(place_meeting(x,y+1,obj_water) && prev_move != 0 && hspd == 0)
{
	var _id = scr_touch_id(obj_water);
	if(_id.sprite_index == spr_water_solid)
	{
		hspd = prev_move;
		if(hspd >0)
			sprite_index = spr_player_standing_right;
		else if(hspd <0)
			sprite_index = spr_player_standing_left;
	}
}
//when player is on the wall
if(place_meeting(x,y+1,obj_wall)) //1 pixel down from player's object
{
	if(key_jump) vspd = key_jump*-jumpspd;
	if(key_down)
	{
		if(position == LEFT)
			sprite_index = spr_player_leaning_left;
		if(position == RIGHT)
			sprite_index = spr_player_leaning_right;
	} 
}
if(place_meeting(x,y,obj_water))
{
		if(key_jump) vspd = key_jump*-jumpspd*0.5;
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
if(place_meeting(x,y,obj_rope) && key_up)
{
		is_up = true;
}
if(is_up == true && (key_left || key_right || key_jump))
{
	is_up = false;
	sprite_index = spr_player_front;
	if(key_jump)
	{
		vspd = key_jump*-jumpspd;
	}
}
if(is_up)
{
	sprite_index = spr_player_string;
	vspd = (-key_up + key_down)*movespd;
	if(vspd == 0)
		image_speed = 0;
	else
		image_speed = 1;
	if(key_left && key_right)
		is_up = false;
	if(place_meeting(x,y+vspd,obj_wall))
	{
		while(!place_meeting(x,y+sign(vspd),obj_wall))
		{
			y +=sign(vspd);
		}
		vspd = 0;
	}
}
if(!place_meeting(x,y,obj_rope))
{
	is_up = false;
	image_speed = 1;
}


x += hspd;
y += vspd;


////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////CHECKING HEALTH AND FIX ERROR////////////////////////////////
//checking pressed by wall(wood,frozen water etc)
//die by falling
if(init_vspd >30)
{
	if(scr_touch(obj_wall))
	{
		if(init_vspd > 10)
		{
			heart -= round(init_vspd/10);
		}
	}
}
if(scr_touch(obj_water))
{
	var water_id = scr_touch_id(obj_water);
	if(water_id.state == 2)
	{
	 heart -= 0.05;
	}
}
if(scr_touch(obj_tree))
{
	var tree_id = scr_touch_id(obj_tree);
	if(tree_id.state == 2)
	{
		heart -= 0.1;
	}
}
if(scr_touch(obj_wood))
{
	var wood_id = scr_touch_id(obj_wood);
	if(wood_id.state == 2)
	{
		heart -= 0.1;
	}
	if(wood_id.y > y)
	{
		if(wood_id.vspd > 10)
		{
			heart -= round(vspd/10);
		}
	}
}
if(place_meeting(x,y,obj_wall))
{
	var _id = scr_touch_id(obj_wall);
	if(place_meeting(x,y+1,obj_wall))
	{
		y += y%32;
	}
	if(place_meeting(x,y-1,obj_wall))
	{
		y -= y%32;
	}
}
		






