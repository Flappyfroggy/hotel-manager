extends Control
@onready var review1_text = $review_text
@onready var s1 = $star1
@onready var s2 = $star2
@onready var s3 = $star3
@onready var s4 = $star4
@onready var s5 = $star5
@onready var animation = $AnimationPlayer
@onready var dialogue = preload("res://1star_review.dialogue")
var go_hotel_intro := false
func _ready():
	roll_number()
	s1.hide()
	s2.hide()
	s3.hide()
	s4.hide()
	s5.hide()
	animation.play("fade")
	alien.play()
	if Timeofday.day == 1 and e.amount_of_furniture >= 3:
		review1_text.text = "This place is SO bad. The aura here is SO off. One star!"
		s1.show()
	elif Timeofday.day == 1 and e.amount_of_furniture >= 2:
		review1_text.text = "terrible! One star!"
		s1.show()
	elif Timeofday.day == 1 and e.bought_bed:
		review1_text.text = "No! Just NO. One star!"
		s1.show()
	elif Timeofday.day == 1:
		review1_text.text = "...Disgusting. One star!"
		s1.show()
		
	elif not e.paid_owner and e.money <= 2000:
		review1_text.text = "I'm still waiting for the money."
		s1.show()
		s2.show()
		e.review = 2
	elif not e.paid_owner and e.money >= 2000:
		review1_text.text = "It would seem you haven enough funds for the payment."
		s1.show()
		s2.show()
		s3.show()
		e.review = 3
		e.pay_owner = true
	elif e.paid_owner and not e.paid_marketing_fees:
		review1_text.text = "Hey. We need to talk."
		s1.show()
		s2.show()
		s3.show()
		e.review = 3
		e.marketing_fees = true
		go_hotel_intro = true
	elif e.paid_owner and e.paid_marketing_fees and not e.paid_emergency_exit:
		randomize()
		var random_float = randf()
		if random_float >= 0.5:
			e.emergency_exit = true
			review1_text.text = "Meet me outside"
			s1.show()
			s2.show()
			s3.show()
			e.review = 3
			go_hotel_intro = true
		else:
			review1_text.text = "Interesting."
			s1.show()
			s2.show()
			s3.show()
			e.review = 3
	elif e.paid_owner and e.paid_marketing_fees and e.paid_emergency_exit and not e.bought_fire_extinguisher and not e.fire_extinguisher:
		randomize()
		var random_float = randf()
		if random_float >= 0.5:
			e.no_fire_extinguisher = true
			e.fire_extinguisher = true
			review1_text.text = "Me again. Meet me outside."
			s1.show()
			s2.show()
			s3.show()
			e.review = 3
			go_hotel_intro = true
		else:
			review1_text.text = "Interesting."
			s1.show()
			s2.show()
			s3.show()
			e.review = 3
	elif e.check_for_fire_extinguisher:
		if e.bought_fire_extinguisher:
			review1_text.text = "hey, you bought fire extinguishers! nice."
			e.check_for_fire_extinguisher = false
			s1.show()
			s2.show()
			s3.show()
			e.review = 3
		else:
			review1_text.text = "you still don't have a fire extinguisher here? we're going to have to charge you for that."
			e.money -= 500
			s1.show()
			s2.show()
			e.review = 2
	elif e.paid_owner and e.paid_marketing_fees and e.paid_emergency_exit and e.bought_fire_extinguisher and e.broken_stairs:
		e.broken_stairs = false
		review1_text.text = "Hey - the stairs were broken but i fixed it. It'll cost you $800."
		e.money -= 800
		s1.show()
		s2.show()
		e.review = 2
	elif e.paid_owner and e.paid_marketing_fees and e.paid_emergency_exit and e.bought_fire_extinguisher and e.water_leak:
		e.water_leak = false
		review1_text.text = "Hihi, i fixed the water leak i saw in the building. can you give me $700 for it?"
		e.money -= 700
		s1.show()
		s2.show()
		s3.show()
		e.review = 3
	elif e.amount_of_furniture >= 6:
		review1_text.text = "this is great!"
		s1.show()
		s2.show()
		s3.show()
		s4.show()
		s5.show()
		e.review = 5
	elif e.amount_of_furniture > 3 and e.amount_of_furniture <= 5:
		review1_text.text = "A pretty comfortable amount of furniture here."
		s1.show()
		s2.show()
		s3.show()
		s4.show()
		e.review = 4
	elif e.amount_of_furniture <= 3 and e.amount_of_furniture > 1:
		review1_text.text = "cozy, but could use a bit more furniture and decorations."
		s1.show()
		s2.show()
		s3.show()
		e.review = 3
	elif e.amount_of_furniture == 1:
		review1_text.text = "not a lot here. the bed is comfortable though."
		s2.show()
		s3.show()
		e.review = 2
	elif e.amount_of_furniture < 1:
		review1_text.text = "theres like.. nothing here."
		s3.show()
		e.review = 1
func roll_number():
	randomize()
	var number = randf()
	if number >= 0.6 and number <= 0.80:
		e.broken_stairs = true
	elif number >= 0.81:
		e.water_leak = true
	else:
		e.water_leak = false
		e.broken_stairs = false
func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	queue_free()
	if Timeofday.day == 1:
		DialogueManager.show_dialogue_balloon(dialogue, "start")
		e.review = 1
	elif not e.paid_owner and e.money >= 2000:
		get_tree().change_scene_to_file("res://hotel_intro.tscn")
	if go_hotel_intro:
		get_tree().change_scene_to_file("res://hotel_intro.tscn")
		go_hotel_intro = false
