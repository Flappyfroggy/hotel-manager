extends Control
var day = int()
var hour = int()
var minute = int()
var time_scale = 20
var day_ = 0
var center_position
@onready var review_menu_preload = preload("res://day_end.tscn")
func _ready():
	var viewport_size = get_viewport_rect().size
	center_position = viewport_size / 2.0
func _process(delta):
	var time_step = time_scale * delta
	minute += time_step
	if minute >= 60:
		minute = 0
		hour += 1
	if hour >= 24:
		day += 1
		hour = 0
	if day != day_:
		var review_menu = review_menu_preload.instantiate()
		add_child(review_menu)
		review_menu.show()
		review_menu.z_index = 999
		review_menu.position = center_position
		day_ += 1
