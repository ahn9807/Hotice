/// @description kill self
 
if(frozensignal == true)
{
	if(wall_id == noone)
	{
		wall_id = instance_create_layer(x,y,"layer_wall",obj_wall);
		wall_id.image_xscale = self.sprite_height/wall_id.sprite_height;
		wall_id.image_yscale = self.sprite_width/wall_id.sprite_width;
	}
	image_speed = 0;
}
else
{
	if(wall_id != noone)
	{
		instance_destroy(wall_id);
		wall_id = noone;
	}
	image_speed = 1;
}

if(!instance_exists(new_water))
{
	new_water = noone;
}

if(!instance_place(x,y+32,obj_wall) && !instance_place(x,y+32,obj_water_flow) && !instance_place(x,y+32,obj_water) && !place_meeting(x,y,obj_wall))
{
	is_flow = true;
}
if(instance_place(x,y+32,obj_water))
	image_yscale = 1.5;
else
{
	if(instance_place(x,y+32,obj_water_flow) != new_water)
		is_flow = false;
}
if(instance_place(x,y+1,obj_water_flow) && frozensignal == true)
{
	is_flow = true;
}

if(is_flow == true && new_water == noone)
{
	new_water = instance_create_layer(x,y+32,"layer_water",obj_water_flow);
	new_water.master = master;
	new_water.frozensignal = frozensignal;
}
if(is_flow == false && new_water != noone)
{
	new_water.killsignal = true;
	new_water = noone;
}
if(place_meeting(x,y,obj_water) && sprite_height == 32)
	killsignal = true;



if(killsignal)
{
	if(new_water != noone)
		new_water.killsignal = true;
	if(wall_id != noone)
	{
		instance_destroy(wall_id);
	}
	instance_destroy();
}
if(new_water != noone && frozensignal == true)
{
	new_water.frozensignal = true;
}
else if(new_water != noone && frozensignal == false)
{
	new_water.frozensignal = false;
}

if(scr_touch(obj_tree))
{
	var other_id = scr_touch_id(obj_tree);
	switch(other_id.state)
	{
		case 0:
		{
			if(master.state - 1 >= 0)
			{
				master.state--;
				other_id.state = 1;
			}
				break;
		}
		case 1:
		{
			break;
		}
		case 2:
		{
			if(master.state + 1 <= 3)
			{
				master.state ++;
				other_id.state = 1;
			}
			break;
		}
		case 3:
		{
			break;
		}
	}	
	master.statesignal = true;
}

if(scr_touch(obj_wood))
{
	var other_id = scr_touch_id(obj_wood);
	switch(other_id.state)
	{
		case 0:
		{
			if(master.state - 1 >= 0)
			{
				master.state --;
				other_id.state = 1;
			}
			master.statesignal = true;
			break;
		}
		case 1:
		{
			break;
		}
		case 2:
		{
			if(master.state + 1 <= 3)
			{
				master.state ++;
				other_id.state = 1;
			}
			master.statesignal = true;
			break;
		}
		case 3:
		{
			break;
		}
	}
}