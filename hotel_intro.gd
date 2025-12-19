extends Node2D
@onready var intro = preload("res://hotel_intro.dialogue")
@onready var transition = $transition_pt1/AnimationPlayer
@onready var sprite = $transition_pt1/Sprite2D
func _ready():
	sprite.show()
	transition.play("transition2")
func _process(_float) -> void:
	if e.hotel_intro_ended:
		get_tree().change_scene_to_file("res://node_2d.tscn")
	if e.transition_finish:
		e.transition_finish = false
		DialogueManager.show_dialogue_balloon(intro, "start")
