extends Node2D

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "to_room1":
		e.room1_full = false
		if e.customers > 2:
			e.customers -= 1
		print(e.customers)
		queue_free()
	elif anim_name == "to_room2":
		e.room2_full = false
		if e.customers > 2:
			e.customers -= 1
		queue_free()
	elif anim_name == "to_room3":
		e.room3_full = false
		if e.customers > 2:
			e.customers -= 1
		queue_free()
	elif anim_name == "to_room4":
		e.room4_full = false
		if e.customers > 2:
			e.customers -= 1
		queue_free()
	elif anim_name == "to_room5":
		e.room5_full = false
		if e.customers > 2:
			e.customers -= 1
		queue_free()
	elif anim_name == "to_room6":
		e.room6_full = false
		if e.customers > 2:
			e.customers -= 1
		queue_free()
