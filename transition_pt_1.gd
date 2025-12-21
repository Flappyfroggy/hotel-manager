extends Node2D
@onready var sprite = $Sprite2D
func _ready():
	sprite.hide()
func _on_animation_player_animation_finished(anim_name: StringName):
	match anim_name:
		"transition1":
			e.transition_finish = true
		"transition2":
			e.transition2_finish = true
