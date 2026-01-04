extends Node2D
@onready var transition = $transition_pt1/AnimationPlayer
@onready var sprite = $transition_pt1/Sprite2D
@onready var bunny_preload = preload("res://bunny_inside.tscn")
@onready var coins = $RichTextLabel
@onready var animatione = $AnimationPlayer
@onready var tutorial_panel = $animation_tutorial/Panel
func _ready():
	sprite.show()
	transition.play("transition2")
	tutorial_panel.hide()
func _process(_float) -> void:
	coins.text = "coins:	" + str(e.money)
	if not e.room1_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room1")
		e.room1_full = true
	if not e.room2_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room2")
		e.room2_full = true
	if not e.room3_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room3")
		e.room3_full = true
	if not e.room4_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room4")
		e.room4_full = true
	if not e.room5_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room5")
		e.room5_full = true
	if not e.room6_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room6")
		e.room6_full = true
	if e.transition2_finish:
		e.transition2_finish = false
		if not e.played_tutorial:
			alien.play(2)
			animatione.play("tutorial")
			tutorial_panel.show()
			e.played_tutorial = true

func _on_button_pressed() -> void:
	click.play()
	get_tree().change_scene_to_file("res://hotel_outside.tscn")
	e.room1_full = false
	e.room2_full = false
	e.room3_full = false
	e.room4_full = false
	e.room5_full = false
	e.room6_full = false


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "tutorial":
		alien.stop()
