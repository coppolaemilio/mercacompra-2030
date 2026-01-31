extends Control

func _ready() -> void:
	Audio.play_music(load("res://audio/music/Song-2-malagajam.mp3"))
	$Control/AnimationPlayer.play("intro")
	

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				$Control.position.y -= 10
			# zoom out
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				$Control.position.y -= 10
	
	if $Control.position.y < -890:
		start_game()


func start_game():
	get_tree().change_scene_to_file("res://scenes/default.tscn")
