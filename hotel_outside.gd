extends Node2D
@onready var timer = $Timer
@onready var npc_preload = preload("res://npc.tscn")
@onready var timer2 = $advertisements
var npc
var timerstarted: bool = false
var advertisement_timerstarted: bool = false
func _process(_float) -> void:
	if not timerstarted:
		timer.start()
		timerstarted = true
	if e.advertisement > 25 and not advertisement_timerstarted:
		timer2.start()
		advertisement_timerstarted = true
func _on_timer_timeout() -> void:
	timerstarted = false
	npc = npc_preload.instantiate()
	add_child(npc)
	e.customers += 1

func _on_advertisements_timeout() -> void:
	npc = npc_preload.instantiate()
	add_child(npc)
	e.customers += 1
	advertisement_timerstarted = false
	print(e.advertisement)
