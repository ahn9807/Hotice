//@insert description (object name)
var touch_id = noone;
if(place_meeting(x+1,y,argument0))
{
	touch_id = instance_place(x+1,y,argument0);
	return touch_id;
}
if(place_meeting(x-1,y,argument0))
{
	touch_id = instance_place(x-1,y,argument0);
	return touch_id;
}
if(place_meeting(x,y+1,argument0))
{
	touch_id = instance_place(x,y+1,argument0);
	return touch_id;
}
if(place_meeting(x,y-1,argument0))
{
	touch_id = instance_place(x,y-1,argument0);
	return touch_id;
}
	