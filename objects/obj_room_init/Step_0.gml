/// @description Respawn player
heart = obj_player.heart;

if(heart < 0)
{
	restart_flag = true;
	room_restart();
}
if(restart == true)
{
	restart_flag = true;
	restart = false;
	room_restart();
}
