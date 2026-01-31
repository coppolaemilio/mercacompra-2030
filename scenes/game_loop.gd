extends Node

@export var initial_delay: float = 5.0
@export var item_change_interval: float = 1.0
@export var item_duration: int = 15
@export var shopping_list_length: int = 5

const ITEMS: Items = preload("uid://br0myrasc06dd")

var _shopping_list: ShoppingList

func _ready() -> void:
	get_tree().create_timer(initial_delay).timeout.connect(_pick_new_item)
	Globals.item_removed.connect(_item_removed)
	_shopping_list = ShoppingList.new(ITEMS, shopping_list_length)


func _pick_new_item() -> void:
	var item: Item = _shopping_list.next()
	if item == null:
		print('finished')
	else:
		Globals.new_item.emit(item, item_duration)


func _item_removed() -> void:
	get_tree().create_timer(item_change_interval).timeout.connect(_pick_new_item)
