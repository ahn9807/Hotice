/// @description Insert description here
// You can write your code in this editor
if(last_room == room_main)
{
	last_room = prev_room;
}
var num = instance_number(obj_gotoroom);
for(var i=0;i<num;i++)
{
	var _id = instance_find(obj_gotoroom,i);
	if(_id.next_room == last_room && room != room_main)
	{
		xx = _id.x;
		yy = _id.y;
	}
}
var num = instance_number(obj_gotoroom_surprise);
for(var i=0;i<num;i++)
{
	var _id = instance_find(obj_gotoroom_surprise,i);
	if(_id.next_room == last_room)
	{
		xx = _id.x;
		yy = _id.y;
	}
}	
if(room == room_main)
{
	xx = 1000;
	yy = 777;
}
if(room != room_main)
{
	prev_room = last_room;
}
instance_create_layer(xx,yy,"layer_player",obj_player);
