extends Control
@onready var review1_text = $review_text
@onready var s1 = $star1
@onready var s2 = $star2
@onready var s3 = $star3
@onready var s4 = $star4
@onready var s5 = $star5
@onready var animation = $AnimationPlayer
func _ready():
	s1.hide()
	s2.hide()
	s3.hide()
	s4.hide()
	s5.hide()
	animation.play("fade")
	if Timeofday.day == 1 and e.bought_bed and e.bought_bookshelf and e.bought_sign:
		review1_text.text = "This place is SO bad. The aura here is SO off. One star!"
		s1.show()
		e.review = int(1)
	elif Timeofday.day == 1 and e.bought_bed and e.bought_bookshelf:
		review1_text.text = "Sufficiently terrible! One star!"
		s1.show()
	elif Timeofday.day == 1 and e.bought_bed and e.bought_sign:
		review1_text.text = "Utterly lacking. One star!"
		s1.show()
	elif Timeofday.day == 1 and e.bought_bed:
		review1_text.text = "No! Just NO. One star!"
		s1.show()
	elif Timeofday.day == 1:
		review1_text.text = "...Disgusting. One star!"
		s1.show()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
