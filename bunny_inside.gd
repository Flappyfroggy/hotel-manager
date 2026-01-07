extends Node2D
@onready var money_label = $RichTextLabel
@onready var animation = $AnimationPlayer
var money
func _ready():
	money_label.hide()
func _process(delta: float) -> void:
	money = 3 * e.customers * e.advertisement_multiplier + e.review * 2
	money_label.text = "+" + str(money) + " coins"
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	e.money += money
	if anim_name == "to_room1":
		e.room1_full = false
		if e.customers > 1:
			e.customers -= 1
		if e.customers < 1:
			e.customers += 1
		money_label.show()
		animation.play("money")
	elif anim_name == "to_room2":
		e.room2_full = false
		if e.customers > 2:
			e.customers -= 1
		if e.customers < 1:
			e.customers += 1
		animation.play("money")
		money_label.show()
	elif anim_name == "to_room3":
		e.room3_full = false
		if e.customers > 2:
			e.customers -= 1
		if e.customers < 1:
			e.customers += 1
		animation.play("money")
		money_label.show()
	elif anim_name == "to_room4":
		e.room4_full = false
		if e.customers > 2:
			e.customers -= 1
		if e.customers < 1:
			e.customers += 1
		animation.play("money")
		money_label.show()
	elif anim_name == "to_room5":
		e.room5_full = false
		if e.customers > 2:
			e.customers -= 1
		if e.customers < 1:
			e.customers += 1
		animation.play("money")
		money_label.show()
	elif anim_name == "to_room6":
		e.room6_full = false
		if e.customers > 2:
			e.customers -= 1
		if e.customers < 1:
			e.customers += 1
		animation.play("money")
		money_label.show()
	if anim_name == "money":
		queue_free()
