extends Label

var time_left = 15

var buzzer = load("res://audio/sfx/489506__bockelsound__tursummer-kurz-einmal.wav")
var warning = load("res://audio/sfx/387537__soundwarf__panorouge.wav")

func _ready():
	text = str(time_left)
	Globals.new_item.connect(_new_item)
	Globals.item_bought.connect(_item_bought)


func _new_item(_item: Item, duration: int) -> void:
	time_left = duration
	$Timer.start()
	_display_time(time_left)


func _item_bought() -> void:
	$Timer.stop()


func _on_timer_timeout() -> void:
	time_left -= 1
	_display_time(time_left)


func _display_time(time: int):
	set("theme_override_colors/font_color", Color("#d2d6d9"))
	if time <= 10 and time > 0:
		Audio.play_sound(warning)
		set("theme_override_colors/font_color", Color("ff4435ff"))
	if time == 0:
		$Timer.stop()
		set("theme_override_colors/font_color", Color("ff4435ff"))
		Audio.play_sound(buzzer)
		Globals.time_finished.emit()
	text = str(time)
