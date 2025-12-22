extends Node2D
@onready var transition = $transition_pt1/AnimationPlayer
@onready var sprite = $transition_pt1/Sprite2D
@onready var bunny_preload = preload("res://bunny_inside.tscn")
@onready var coins = $RichTextLabel
func _ready():
	sprite.show()
	transition.play("transition2")
func _process(_float) -> void:
	coins.text = "coins:	" + str(e.money)
	if not e.room1_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room1")
		e.money += 3 * e.customers
		e.room1_full = true
	if not e.room2_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room2")
		e.money += 3 * e.customers
		e.room2_full = true
	if not e.room3_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room3")
		e.money += 3 * e.customers
		e.room3_full = true
	if not e.room4_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room4")
		e.money += 3 * e.customers
		e.room4_full = true
	if not e.room5_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room5")
		e.money += 3 * e.customers
		e.room5_full = true
	if not e.room6_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room6")
		e.money += 5 * e.customers
		e.room6_full = true

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://hotel_outside.tscn")
	e.room1_full = false
	e.room2_full = false
	e.room3_full = false
	e.room4_full = false
	e.room5_full = false
	e.room6_full = false
