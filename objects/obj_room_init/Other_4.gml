/// @description Insert description here
// You can write your code in this editor
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
instance_create_layer(xx,yy,"layer_player",obj_player);
