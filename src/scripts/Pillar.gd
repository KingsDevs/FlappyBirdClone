extends KinematicBody2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

export var speed :int = -200
var velocity = Vector2(0, 0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	velocity.x += speed * delta
	velocity = move_and_slide(velocity, Vector2.UP)
