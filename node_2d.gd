extends Node2D
@onready var bed = $layer_holder/bed
@onready var bookshelf = $layer_holder/bookshelf
@warning_ignore("shadowed_global_identifier")
@onready var sign = $layer_holder/sign
@onready var animation = $AnimationPlayer
@onready var tutorial_pt1 = $animation
@onready var tutorial_pt2 = $animation_pt2
func _ready():
	if not e.bought_bed:
		bed.hide()
	if not e.bought_bookshelf:
		bookshelf.hide()
	if not e.bought_sign:
		sign.hide()
	if e.tutorial:
		animation.play("tutorial")
	if not e.tutorial:
		tutorial_pt1.hide()
		tutorial_pt2.hide()
func _process(_float) -> void:
	if e.add_bed and not e.bought_bed:
		bed.show()
		e.bought_bed = true
		if e.tutorial:
			tutorial_pt1.hide()
			animation.play("tutorial_pt2")
			e.tutorial = false
	if e.add_bookshelf and not e.bought_bookshelf and not e.tutorial:
		e.bought_bookshelf = true
		bookshelf.show()
	if e.add_sign and not e.bought_sign and not e.tutorial:
		e.boughtsign = true
		sign.show()
