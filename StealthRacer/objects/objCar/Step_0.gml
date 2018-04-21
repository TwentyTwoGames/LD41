/// @description main loop
if keyboard_check(ord("W")) && yInput < 1
{
	yInput += 0.05;
}
else if keyboard_check(ord("S")) && yInput > -1
{
	yInput += -0.05;
}
else if !keyboard_check(ord("W")) && !keyboard_check(ord("S")) && yInput != 0
{
	yInput -= sign(yInput) * 0.05;
}

if keyboard_check(ord("D"))
{
	steeringWheel += (-turnRate- steeringWheel) *0.3;
}
if keyboard_check(ord("A"))
{
	steeringWheel += (turnRate- steeringWheel) *0.3;
}
if !keyboard_check(ord("A")) && !keyboard_check(ord("D"))
{
	steeringWheel += -steeringWheel *0.3;
}

braking = keyboard_check(vk_space);
	
scrptCarMovement();