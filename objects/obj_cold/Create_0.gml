/// @description initialize ice
alpha = 0;
intense = 1;
steps = 0;
link_obj = noone;
flag = false;
sub_flag = false;
master_flag = true;
steps = 0;
kill_flag = false;

_id = noone;
if(place_meeting(x,y,obj_water))
	_id = instance_place(x,y,obj_water);
else if(place_meeting(x,y,obj_wood))
	_id = instance_place(x,y,obj_wood);
else if(place_meeting(x,y,obj_tree))
	_id = instance_place(x,y,obj_tree);

init_state = -1;
if(instance_exists(_id))
	init_state = _id.state;