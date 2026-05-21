extends CharacterBody2D

#This uses only the mouse to control the character. 
#Clicking on the screen will cause the player to move to the target location.
#
#Note the distance_to() check we make prior to movement. Without this test, 
#the body would "jitter" upon reaching the target position, as it moves slightly past the position and tries to move back, 
#only to move too far and repeat.
#
#Uncommenting the look_at() line will also turn the body to point in its direction of motion if you prefer.
#Tip
#This technique can also be used as the basis of a "following" character. 
#The target position can be that of any object you want to move to.


@export var speed = 400

var target = position

func _input(event):
	# Use is_action_pressed to only accept single taps as input instead of mouse drags.
	if event.is_action_pressed(&"click"):
		target = get_global_mouse_position()

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 10:
		move_and_slide()
