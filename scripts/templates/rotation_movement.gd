extends CharacterBody2D
#
#Rotation + movement
#
#This type of movement is sometimes called "Asteroids-style" because it resembles how that classic arcade game worked. 
#Pressing left/right rotates the character, while up/down moves it forward or backward in whatever direction it's facing.
#Here we've added two variables to track our rotation direction and speed. The rotation is applied directly to the body's 
#rotation property.
#
#To set the velocity, we use the body's transform.x which is a vector pointing in the body's "forward" direction, 
#and multiply that by the speed.

@export var speed = 400
@export var rotation_speed = 1.5

var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("left", "right")
	velocity = transform.x * Input.get_axis("down", "up") * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
