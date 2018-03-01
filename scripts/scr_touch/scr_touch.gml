//@insert description (object name to identified)
var touched = false;
if(place_meeting(x+1,y,argument0))
{
	touched = true;
}
if(place_meeting(x,y+1,argument0))
{
	touched = true;
}
if(place_meeting(x-1,y,argument0))
{
	touched = true;
}
if(place_meeting(x,y-1,argument0))
{
	touched = true;
}

return touched;