extends Control
@onready var moneyamount = $RichTextLabel
@onready var transition = $transition_pt1/AnimationPlayer
@onready var sprite = $transition_pt1/Sprite2D
@onready var too_broke_text = $too_broke
@onready var animation = $AnimationPlayer
func _on_button_pressed() -> void: #bed purchase
	click.play()
	if not e.bought_bed:
		if e.money >= 800:
			e.money -= 800
			e.add_bed = true
			e.amount_of_furniture += 1
		elif e.money <= 800:
			play_too_broke_animation()
func _process(_float) -> void:
	moneyamount.text = "coins:	" + str(e.money)


func _on_exit_pressed() -> void:
	click.play()
	get_tree().change_scene_to_file("res://hotel_outside.tscn")


func _on_button_2_pressed() -> void: #bookshelf purchase
	click.play()
	if e.bought_bed and not e.bought_bookshelf:
		if e.money >= 1500:
			e.money -= 1500
			e.add_bookshelf = true
			e.amount_of_furniture += 1
		elif e.money <= 1500:
			play_too_broke_animation()

func _on_button_3_pressed() -> void: #sign purchase
	click.play()
	if e.bought_bed and not e.bought_sign:
		if e.money >= 2000:
			e.money -= 2000
			e.add_sign = true
			e.amount_of_furniture += 1
		elif e.money <= 2000:
			play_too_broke_animation()

func _ready():
	sprite.show()
	transition.play("transition2")
	too_broke_text.hide()
func play_too_broke_animation():
	too_broke_text.show()
	animation.play("not_enough_money")


func _on_button_4_pressed() -> void: #fire extinguisher purchase
	click.play()
	if e.bought_bed and not e.bought_fire_extinguisher:
		if e.money >= 800:
			e.money -= 800
			e.add_fire_extinguisher = true
			e.amount_of_furniture += 1
		elif e.money <= 800:
			play_too_broke_animation()


func _on_button_5_pressed() -> void: #cactus plant purchase
	click.play()
	if e.bought_bed and not e.bought_cactus:
		if e.money >= 1000:
			e.money -= 1000
			e.add_cactus = true
			e.amount_of_furniture += 1
		elif e.money <= 1000:
			play_too_broke_animation()


func _on_button_6_pressed() -> void: #other plant purchase
	click.play()
	if e.bought_bed and not e.bought_plant:
		if e.money >= 1300:
			e.money -= 1300
			e.add_plant = true
			e.amount_of_furniture += 1
		elif e.money <= 1300:
			play_too_broke_animation()


func _on_button_7_pressed() -> void: #bedside table purchase
	click.play()
	if e.bought_bed and not e.bought_table:
		if e.money >= 600:
			e.money -= 600
			e.add_table = true
			e.amount_of_furniture += 1
		elif e.money <= 600:
			play_too_broke_animation()
