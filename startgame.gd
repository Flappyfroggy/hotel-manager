extends Control
@onready var transition = $transition_pt1/AnimationPlayer
@onready var sprite = $transition_pt1/Sprite2D
var b := false
func _on_button_pressed() -> void:
	if not b:
		sprite.show()
		sprite.position = Vector2(0,0)
		transition.play("transition1")
		e.money += 800
		b = true
func _process(_delta: float) -> void:
	if e.transition_finish:
		e.transition_finish = false
		get_tree().change_scene_to_file("res://hotel_intro.tscn")
