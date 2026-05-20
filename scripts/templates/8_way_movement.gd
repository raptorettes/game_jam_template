extends CharacterBody2D
# In this scenario, you want the user to press the four directional keys (up/left/down/right or W/A/S/D) 
# and move in the selected direction. The name "8-way movement" comes from the fact that the player can move 
# diagonally by pressing two keys at the same time.

# In the get_input() function, we use Input get_vector() to check for the four key events and sum return a direction vector.
# We can then set our velocity by multiplying this direction vector, which has a length of 1, by our desired speed.

@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
