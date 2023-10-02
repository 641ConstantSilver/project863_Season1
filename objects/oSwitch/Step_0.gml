if place_meeting(x, y, oPlayer) && keyboard_check_pressed(vk_enter) && state != 1
{
	state = 1;
	odoor.sprite_index = sDoorOpen;
} 
else
{
	if place_meeting(x, y, oPlayer) && keyboard_check_pressed(vk_enter) && state != 0
	{
		state = 0;
		odoor.sprite_index = sDoor; // I switched it to use sprite_index instead because it doesn't animate.
	} 
}

image_index = state;