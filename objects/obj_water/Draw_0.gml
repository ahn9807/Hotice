/// @description Insert description here
// You can write your code in this editor
draw_self();
image_alpha = 0.5;
if(state < 1)
{
	sprite_index = spr_water_solid;
}
else if(1<=state && state<2)
{
	if(is_surface == true)
	{
		sprite_index = spr_water_liquid_surface;
	}
	else
	{
		sprite_index = spr_water_liquid;
	}
}
else if(2<=state && state <3)
{
	if(is_surface == true)
	{
		sprite_index = spr_water_boil_surface;
	}
	else
	{
		sprite_index = spr_water_boil;
	}
}
else
{
	sprite_index = spr_water_gas;
	if(new_water != noone)
		new_water.killsignal = true;
	instance_destroy();
}
