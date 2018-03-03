/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x,y,obj_player))
{
	draw_set_font(font);
	var _size = font_get_size(font);
	var _word = (window_get_width() - 216)/font_get_size(font);
	var _line = string_length(text)/_word;
	draw_set_color(color);
	
	var i = floor(steps/30);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_sprite_ext(spr_notice_gui,0,window_get_width()/2,window_get_height()/2,1,1,rot,c_white,0.8);
	draw_text_ext_transformed(window_get_width()/2,window_get_height()/2,text,font_get_size(font)*1.2,400,1,1,rot);
}
