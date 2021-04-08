/// @description step for ice
var var_mode = 0;
if(obj_mouse.mouse_mode == 1)
{
	if(mouse_check_button_pressed(mb_left)&&cur_state == 0)
	{
		prev_ice = instance_create_layer(obj_mouse.x,obj_mouse.y,"layer_ice",obj_cold);
		cur_state = 1;
		intense = 1;
		var_mode = 1;
	}
	if(mouse_check_button_pressed(mb_right)&&cur_state == 0)
	{
		prev_hot = instance_create_layer(obj_mouse.x,obj_mouse.y,"layer_hot",obj_hot);
		cur_state = 2;
		intense = 1;
		var_mode = 1;
	}

	if(cur_state == 1&&var_mode != 1) // when ice state
	{
		if(mouse_check_button_pressed(mb_left))
		{
			intense = (intense + 1 )%4;
		}
		else if(mouse_check_button_pressed(mb_right))
		{
			cur_hot = instance_create_layer(obj_mouse.x,obj_mouse.y,"layer_hot",obj_hot);
			cur_hot.intense = intense;
			cur_hot.link_obj = prev_ice;
			prev_ice.link_obj = cur_hot;
			cur_state = 0;
		}	
			prev_ice.intense = intense;
	}

	if(cur_state == 2&&var_mode != 1) // when hot state
	{
		if(mouse_check_button_pressed(mb_right))
		{
			intense = (intense + 1 )%4;
		}
		else if(mouse_check_button_pressed(mb_left))
		{
			cur_ice = instance_create_layer(obj_mouse.x,obj_mouse.y,"layer_ice",obj_cold);
			cur_ice.intense = intense;
			cur_ice.link_obj = prev_hot;
			prev_hot.link_obj = cur_ice;
			cur_state = 0;
		}
			prev_hot.intense = intense;
	}
}






	