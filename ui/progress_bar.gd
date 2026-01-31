extends Control


func _ready() -> void:
	Globals.new_item.connect(_new_item)


func _new_item(item: Item, _duration: int) -> void:
	$ProgressBar.max_value = item.price


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ProgressBar.set_value(Globals.payed_amount)
	$Label.text = str(int($ProgressBar.value)) + "€"
