extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var jump_force : int 
export var gravity : int 
export var rotation_speed : float

var rotation_dir: float = 0
onready var velocity = Vector2(0, 0)



# Called when the node enters the scene tree for the first time.
func get_input(delta):
	velocity.x = 0
	
	var jump = Input.is_action_just_pressed("jump")
	if jump :  
		velocity = Vector2(0, jump_force)
		if(rotation_degrees >= -45):
			rotation += bird_rotate(-1, rotation_speed+ 5) * delta
	
func bird_rotate(dir:float, rspeed:float) -> float:
	var bird_rotation = rspeed * dir
	return bird_rotation
	

func _physics_process(delta):
	get_input(delta)
	velocity.y += gravity * delta
	if(rotation_degrees <= 45):
		rotation += bird_rotate(1, rotation_speed) * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))

