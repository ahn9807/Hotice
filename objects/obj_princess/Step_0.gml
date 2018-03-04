/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_player) && flag == false)
{
	init_dis = distance_to_object(obj_player);
	flag = true;
}
image_alpha = distance_to_object(obj_player)/init_dis;