extends CharacterBody2D

# Character for a 2D top down game. Has 8 directions 

@export var move_speed: float = 100
@export var starting_direction: Vector2 = Vector2(0, 1)
@export var interact_distance: float = 35.0

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

var facing_direction: Vector2 = Vector2(0, 1)
var world_mouse_pos: Vector2 = Vector2.ZERO

func _ready() -> void:
	update_anamation_parameters(starting_direction)

func _process(_delta):
	world_mouse_pos = get_global_mouse_position()

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	update_anamation_parameters(input_direction)
	velocity = input_direction * move_speed
	move_and_slide()


#func _input(event):
	#if event is InputEventKey and event.pressed and event.is_action("interact"):
		#_try_interact()
#
#func _try_interact():


func update_anamation_parameters(move_input: Vector2):
	if move_input != Vector2.ZERO:
		facing_direction = move_input
		animation_tree.set('parameters/Walk/blend_position', move_input)
		animation_tree.set('parameters/Idle/blend_position', move_input)

func pick_new_state():
	if velocity != Vector2.ZERO:
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")
