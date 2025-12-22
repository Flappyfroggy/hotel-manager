extends Control
var day = int()
var hour = int()
var minute = int()
var time_scale = 20
func _process(delta):
	var time_step = time_scale * delta
	minute += time_step
	if minute >= 60:
		minute = 0
		hour += 1
	if hour >= 24:
		day += 1
		hour = 0
