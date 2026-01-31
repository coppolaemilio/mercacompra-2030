extends Control

@export var speed_curve: Curve

@onready var timer: Timer = $Timer

var _scroll_time: float = 0


func _ready() -> void:
	timer.timeout.connect(_stop_mouse)


func _process(delta: float) -> void:
	if Globals.mouse_scrolling and Globals.current_item != null:
		_scroll_time += delta
	else:
		_scroll_time = 0
	
	var money_per_second: float = speed_curve.sample(_scroll_time)
	Globals.payed_amount += money_per_second * delta


func _stop_mouse() -> void:
	Globals.stop_mouse()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP or event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			if event.is_pressed():
				Globals.mouse_scrolling = true
				timer.stop()
			else:
				timer.start()
