extends Control
@onready var review1_text = $review_text
@onready var s1 = $star1
@onready var s2 = $star2
@onready var s3 = $star3
@onready var s4 = $star4
@onready var s5 = $star5
@onready var animation = $AnimationPlayer
@onready var dialogue = preload("res://1star_review.dialogue")
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
	elif e.advertisement_multiplier == 0.5 and not e.money <= 3000:
		review1_text.text = "I'm still waiting for the money. You're only getting a two star review from me until then."
		s1.show()
		s2.show()
	elif e.advertisement_multiplier == 0.5 and e.money >= 3000:
		review1_text.text = "It would seem you haven enough funds for the payment."
		s1.show()
		s2.show()
		s3.show()
		e.pay_owner = true
		get_tree().change_scene_to_file("res://hotel_intro.tscn")
	else:
		review1_text.text = "huh.."

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
	if Timeofday.day == 1:
		DialogueManager.show_dialogue_balloon(dialogue, "start")
