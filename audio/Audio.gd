extends Node

func play_sound_varpitch(sound, variation = 0.5):
	var s = play_sound(sound)
	s.pitch_scale = randf_range(1 - variation, 1 + variation)

func play_sound(sound) -> AudioStreamPlayer:
	var AudioPlayer = AudioStreamPlayer.new()
	get_tree().get_root().get_children()[0].add_child(AudioPlayer)
	AudioPlayer.stream = sound
	AudioPlayer.play()
	AudioPlayer.bus = "SFX"
	AudioPlayer.finished.connect(func():
		AudioPlayer.queue_free()
		)
	return AudioPlayer

func play_music(sound) -> AudioStreamPlayer:
	var AudioPlayer = AudioStreamPlayer.new()
	get_tree().get_root().get_children()[0].add_child(AudioPlayer)
	AudioPlayer.stream = sound
	AudioPlayer.play()
	AudioPlayer.bus = "Music"
	return AudioPlayer
