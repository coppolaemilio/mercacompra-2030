extends Button

@export var sound: AudioStream
@export var variation: bool = false

func _on_pressed() -> void:
	if variation:
		Audio.play_sound_varpitch(sound)
	else:
		Audio.play_sound(sound)
