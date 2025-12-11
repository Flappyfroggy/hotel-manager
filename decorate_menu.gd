extends Control
@onready var moneyamount = $RichTextLabel

func _on_button_pressed() -> void: #bed purchase
	if e.money >= 800:
		e.money -= 800
		e.add_bed = true
func _process(_float) -> void:
	moneyamount.text = "coins:	" + str(e.money)


func _on_exit_pressed() -> void:
	pass 


func _on_button_2_pressed() -> void: #bookshelf purchase
	if e.money >= 450:
		e.money -= 500
		e.add_bookshelf = true


func _on_button_3_pressed() -> void: #sign purchase
	if e.money >= 250:
		e.money -= 250
		e.add_sign = true
