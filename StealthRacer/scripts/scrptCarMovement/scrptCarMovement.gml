//@description moves the car
carSpeed = yVel/(sin(arctan(yVel/xVel)));

if braking
{
	carSpeed += -carSpeed * 0.2;
	//carSpeed = 0;
} 
else
{
	//carSpeed = power(yInput,2);
}

// saves last origin point
ox = sprite_get_xoffset(sprCarShit);
oy = sprite_get_yoffset(sprCarShit);
//right
if carSpeed > 0
{
	sprite_set_offset(sprCarShit, 0,32);
}
if carSpeed < 0
{
	sprite_set_offset(sprCarShit, 64,32);
}
image_angle += steeringWheel * carSpeed/maxSpeed;

//converts car's relative motion into grid relative motion
yVel += yInput *sin(image_angle/180*pi);
xVel += yInput *cos(image_angle/180*pi);

//calculates drag relative to car 
var carDrag = power((carSpeed/maxSpeed),2)*maxSpeed;

//breaks car relative drag into x/y axes
var xDrag = (carDrag * cos(arctan(yVel/xVel))) ;
var yDrag = (carDrag * sin(arctan(yVel/xVel))) ;

xVel += xDrag;
yVel += yDrag;

y -= yVel;
x += xVel;

// Correct x and y position    
var np_len = point_distance(ox,oy, sprite_get_xoffset(sprCarShit), sprite_get_yoffset(sprCarShit));
var np_dir = point_direction(ox,oy, sprite_get_xoffset(sprCarShit), sprite_get_yoffset(sprCarShit));

x = x + lengthdir_x(np_len, image_angle+np_dir);
y = y + lengthdir_y(np_len, image_angle+np_dir);


//debugland
show_debug_message("carSpeed: " + string(carSpeed));
show_debug_message("xVel: " + string(xVel));
show_debug_message("yVel: " + string(yVel));
show_debug_message("xDrag: " + string(xDrag));
show_debug_message("yDrag: " + string(yDrag));
