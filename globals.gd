extends Node


signal new_item(item: Item, duration: int)
signal time_finished
signal item_bought
signal item_removed

var mouse_scrolling: bool = false
var payed_amount: float = 0
var total_spent: float = 0

var current_item: Item = null


func _ready() -> void:
	new_item.connect(
		func (item, _duration):
			current_item = item
			payed_amount = 0
	)
	item_removed.connect(
		func ():
			current_item = null
			total_spent += payed_amount
	)
	time_finished.connect(item_removed.emit)
	item_bought.connect(item_removed.emit)


func stop_mouse():
	mouse_scrolling = false
	if current_item == null:
		return
	if payed_amount >= current_item.price:
		item_bought.emit()
