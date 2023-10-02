	
if place_meeting(x + xspd, y, odoor)
	{
	xspd = 0;	
	}
if place_meeting(x, y + yspd, oWall)
	{
	yspd = 0;	
	}	



if global.Player_char == 1
		{
sprite[RIGHT] = sPlayer_RIGHT;
sprite[UP] = sPlayer_UP;
sprite[LEFT] = sPlayer_LEFT;
sprite[DOWN] = sPlayer_DOWN;
		}
		
if global.Player_char == 2
		{
sprite[RIGHT] = sPlayer_RIGHT1;
sprite[UP] = sPlayer_UP1;
sprite[LEFT] = sPlayer_LEFT1;
sprite[DOWN] = sPlayer_DOWN1;
		}

right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

//get xspd and yspd
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;



if xspd > 0 or xspd < 0 or yspd > 0 or yspd < 0
{
	if !audio_is_playing(mStep)
	{
	audio_play_sound(mStep, 1, true);
	}
} 

else 
{
audio_stop_sound(mStep);
}





if instance_exists(oPauser)
	{
	xspd = 0
	yspd = 0
	}



//set sprite
mask_index = sprite[DOWN];
if yspd == 0
	{
	if xspd > 0 {face = RIGHT};
	if xspd < 0 {face = LEFT};
	}
if xspd > 0 && face == LEFT {face = RIGHT};
if xspd < 0 && face == RIGHT {face = LEFT};
if xspd == 0
	{
	if yspd > 0 {face = DOWN};
	if yspd < 0 {face = UP};
	}
if yspd > 0 && face == UP {face = DOWN};
if yspd < 0 && face == DOWN {face = UP};
sprite_index = sprite[face];














//collision
if place_meeting(x + xspd, y, oWall)
	{
	xspd = 0;	
	}
if place_meeting(x, y + yspd, oWall)
	{
	yspd = 0;	
	}

// collision for doors. this should be done iteratively to save code repetition
// works for now

if place_meeting(x + xspd, y, odoor)
	{
		if odoor.collision == 1
		{
			xspd = 0;
		}
	}
if place_meeting(x, y + yspd, odoor)
	{
		if odoor.collision == 1
		{
			yspd = 0;
		}
	}
	
if place_meeting(x + xspd, y, oDoorUnlocked)
	{
		if oDoorUnlocked.collision == 1
		{
			xspd = 0;
		}
	}
if place_meeting(x, y + yspd, oDoorUnlocked)
	{
		if oDoorUnlocked.collision == 1
		{
			yspd = 0;
		}
	}	

// end collision for doors

//move player
x += xspd;
y += yspd;

//animate
if xspd == 0 && yspd = 0
	{
	image_index = 0;
	}
	
//depth
depth = -y;


// interactions for doors
if keyboard_check_pressed(vk_enter)
{
	var _closest_target = instance_nearest(x, y, oDoorUnlocked);	
	if distance_to_object(_closest_target) < interaction_range
	{
		_closest_target.state = not _closest_target.state
	}
}


//Let me in Matthias...

//You can't keep me out forever...s