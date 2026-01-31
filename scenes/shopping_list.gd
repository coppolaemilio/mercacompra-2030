class_name ShoppingList


var _shopping_list: Array[Item]


func _init(items: Items, shopping_list_length: int) -> void:
	assert(items.items.size() >= shopping_list_length)
	
	var count: int = 0
	while count < shopping_list_length:
		var item = items.pick_random()
		items.items.erase(item)
		_shopping_list.append(item)
		count += 1


func next() -> Item:
	if _shopping_list.size() == 0:
		return null
	var item: Item = _shopping_list[0]
	_shopping_list.remove_at(0)
	return item
