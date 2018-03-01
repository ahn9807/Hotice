/// @description init water_liquid
//make boundary when start making liquids
state = 1;
prev_obj = noone;
flag = false;
other_id = noone;





//Create particle
flags = phy_particle_flag_water | phy_particle_flag_elastic ;
for(var i=10;i>=0;i--)
{
	for(var j=20;j>=0;j--)
	{
		physics_particle_create(flags,x+i,y+j,0,0,c_white,1,1);
	}
}
physics_particle_set_radius(2);
physics_particle_set_density(0.5);