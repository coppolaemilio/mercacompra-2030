class_name Items extends Resource


@export var items: Array[Item]


func pick_random() -> Item:
	return items.pick_random()
