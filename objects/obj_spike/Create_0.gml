/// @description Insert description here
// You can write your code in this editor
damage = 0.1;
position = 0;
up = 0;
down = 1;
right = 2;
left = 3;

if(place_meeting(x,y+1,obj_wall))
{
	position = up;
}
else if(place_meeting(x,y-1,obj_wall))
{
	position = down;
}
else if(place_meeting(x+1,y,obj_wall))
{
	position = right;
}
else if(place_meeting(x-1,y,obj_wall))
{
	position = left;
}
else 
	instance_destroy();