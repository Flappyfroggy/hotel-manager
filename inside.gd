extends Node2D
@onready var transition = $transition_pt1/AnimationPlayer
@onready var sprite = $transition_pt1/Sprite2D
func _ready():
	sprite.show()
	transition.play("transition2")
