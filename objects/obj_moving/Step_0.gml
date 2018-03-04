/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x+1,y,obj_wall))
{
	direc = 1;
}
if(place_meeting(x-1,y,obj_wall))
{
	direc =  -1;
}

var hspd = direc*spd;
x += hspd;
