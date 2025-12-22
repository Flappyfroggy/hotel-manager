extends Control
@onready var time_label = $RichTextLabel
func _process(_delta: float) -> void:
	time_label.text = "Day: " + str(Timeofday.day) + "	Time: " + str(Timeofday.hour) + ":" + str(int(Timeofday.minute))
