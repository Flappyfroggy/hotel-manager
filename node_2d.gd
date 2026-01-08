extends Node2D
@onready var bed = $layer_holder/bed
@onready var bookshelf = $layer_holder/bookshelf
@onready var fire_extinguisher = $layer_holder/extinguish
@warning_ignore("shadowed_global_identifier")
@onready var sign = $layer_holder/sign
@onready var animation = $AnimationPlayer
@onready var tutorial_pt1 = $animation
@onready var tutorial_pt2 = $animation_pt2
@onready var cactus = $layer_holder/cactus
@onready var table = $layer_holder/table
@onready var plant = $layer_holder/plant
@onready var rug = $layer_holder/rug

func _ready():
	if not e.bought_bed:
		bed.hide()
	if not e.bought_bookshelf:
		bookshelf.hide()
	if not e.bought_sign:
		sign.hide()
	if not e.bought_fire_extinguisher:
		fire_extinguisher.hide()
	if not e.bought_cactus:
		cactus.hide()
	if not e.bought_plant:
		plant.hide()
	if not e.bought_table:
		table.hide()
	if not e.bought_rug:
		rug.hide()
func _process(_float) -> void:
	if e.add_bed and not e.bought_bed:
		bed.show()
		e.bought_bed = true
		if e.tutorial:
			tutorial_pt1.hide()
			alien.play(1)
			animation.play("tutorial_pt2")
			e.tutorial = false
	if e.add_bookshelf and not e.bought_bookshelf:
		e.bought_bookshelf = true
		bookshelf.show()
	if e.add_sign and not e.bought_sign:
		e.bought_sign = true
		sign.show()
	if e.add_fire_extinguisher and not e.bought_fire_extinguisher:
		e.bought_fire_extinguisher = true
		fire_extinguisher.show()
	if e.add_cactus and not e.bought_cactus:
		e.bought_cactus = true
		cactus.show()
	if e.add_plant and not e.bought_plant:
		plant.show()
		e.bought_plant = true
	if e.add_table and not e.bought_table:
		table.show()
		e.bought_table = true
	if e.add_rug and not e.bought_rug:
		rug.show()
		e.bought_rug = true
	if e.transition2_finish:
		e.transition2_finish = false
		if e.tutorial:
			alien.play(5)
			animation.play("tutorial")
		if not e.tutorial:
			tutorial_pt1.hide()
			tutorial_pt2.hide()


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	alien.stop()
