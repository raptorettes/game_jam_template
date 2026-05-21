extends CharacterBody2D

#Rotation + movement (mouse)
#
#This style of movement is a variation of the previous one. 
#This time, the direction is set by the mouse position instead of the keyboard. 
#The character will always "look at" the mouse pointer. The forward/back inputs remain the same, however.

#Here we're using the Node2D look_at() method to point the player towards the mouse's position. 
#Without this function, you could get the same effect by setting the angle like this:
#rotation = get_global_mouse_position().angle_to_point(position)

@export var speed = 400

func get_input():
	look_at(get_global_mouse_position())
	velocity = transform.x * Input.get_axis("down", "up") * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
