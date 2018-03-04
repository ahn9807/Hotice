/// @description Insert description here
// You can write your code in this editor
var max_dis = 128;
if(distance_to_object(obj_player) < max_dis)
{
	alpha = 1 - distance_to_object(obj_player)/max_dis;
}
if(sprite_ != noone)
	draw_sprite_ext(sprite_,0,x,y,1,1,rot,c_white,alpha);