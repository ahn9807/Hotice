/// @description changing it's alpha and destroy object;
if(link_obj == noone)
{
	if(intense == 0)
	{
		alpha = 0;
	}
	if(intense == 1)
	{
		alpha = 0.3;
	}
	if(intense == 2)
	{
		alpha = 0.6;
	}
	if(intense == 3)
	{
		alpha = 0.9;
	}
	steps = intense;
}

if(link_obj != noone)
{
	steps -= fps/480;
	alpha = steps/3;
	if(steps <= 0 && kill_flag == true)
	{
		instance_destroy();
	}
}

	

image_alpha = alpha;


if(master_flag == true)
{
    if(instance_exists(obj_cold) && _id != noone)
	{
		if(variable_instance_exists(_id,"state"))
		{		
			if(round(intense) - _id.state <= 3)
			{
				sub_flag = true;
			}
		}
		if((sub_flag == true && obj_cold.sub_flag == true))
		{
			flag = true;
		}
	}
}
else
	flag = false;

if(flag == false)
{
	kill_flag = true;
}
else
{
	if(instance_exists(_id))
	{
		if(_id.state != init_state)
			kill_flag = true;
	}
}

if(!instance_exists(obj_cold))
	kill_flag = true;
