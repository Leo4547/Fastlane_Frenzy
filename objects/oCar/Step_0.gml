var backwards_max_speed = 5
var acceleration = 0.1
var max_speed = 10

var left_key = keyboard_check(vk_left);
var right_key = keyboard_check(vk_right);

var back_key = keyboard_check(vk_down);
var forwards_key = keyboard_check(vk_up);

var brake = keyboard_check(vk_space);
var boost_key = keyboard_check(vk_rshift);

var opposite_angle

if (left_key) and speed > 0.1
{
	image_angle += 2;
	if (image_angle >= 360)
	{
		image_angle -= 360
	}
	direction += 2;
}
if (right_key) and speed > 0.1
{
	image_angle -= 2;
	if (image_angle <= 0)
	{
		image_angle += 360
	}
	direction -= 2;
}

if (brake) and speed > 0.1
{
     motion_add(direction, -acceleration)
}

if (forwards_key) and speed < max_speed
{
    motion_add(image_angle, acceleration)
}

if (back_key)
{
	if (direction != image_angle and speed >= backwards_max_speed) 
	{
		return
	}
	if image_angle >= 180
	{
		opposite_angle = image_angle - 180
	}
	else
	{
		opposite_angle = image_angle + 180
	}
	motion_add(opposite_angle, acceleration)
}


