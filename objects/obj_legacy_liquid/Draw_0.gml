/// @description GPU setting
draw_self();
gpu_set_blendmode_ext(bm_inv_src_alpha,bm_inv_src_color);
physics_particle_draw(flags,1,spr_water_particle,0);
gpu_set_blendmode(bm_normal);
