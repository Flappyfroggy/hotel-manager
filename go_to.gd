extends Control
func _on_decorate_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")

func _on_inside_pressed() -> void:
	pass # Replace with function body.


func _on_advertise_pressed() -> void:
	e.advertisement += 5
	print(e.advertisement)
func _process(delta):
	if e.advertisement > 0:
		e.advertisement -= 15 * delta
		return
