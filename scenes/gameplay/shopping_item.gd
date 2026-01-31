extends Sprite2D

var sfx_pop = load("res://audio/sfx/323741__reitanna__mouth-pop.wav")


func _ready() -> void:
	Globals.new_item.connect(_new_item)
	Globals.item_removed.connect(_remove_item)
	texture = null


func _new_item(item: Item, duration: int) -> void:
	texture = item.sprite
	Audio.play_sound_varpitch(sfx_pop)
	$AnimationPlayer.play("spawn")


func _remove_item() -> void:
	texture = null


func _on_timer_timeout() -> void:
	rotation = 0
	rotation_degrees = [-10, 10, 0, -5, 5].pick_random()
