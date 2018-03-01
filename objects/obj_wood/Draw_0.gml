/// @description Insert description here
// You can write your code in this editor
draw_self();
if(state < 1)
{
	sprite_index = spr_wood_frozen;
	is_move = false;
}
else if(1<=state && state<2)
{
	sprite_index = spr_wood_noting;
	is_move = true;
}
else if(2<=state && state <3)
{
	sprite_index = spr_wood_fire;
	is_move = true;
}
else
{
	instance_destroy();
} 