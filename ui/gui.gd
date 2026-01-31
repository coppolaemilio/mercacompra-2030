extends Control




# Cuando termines de comprar un objeto.
# Suena el sonido de kaching y se ve un marco verde
# en la pantalla.
func positive_feedback():
	$Feedback/AnimationPlayer.play("fade")


# Cuando termine el loop, muestra el ticket
func show_ticket():
	$Ticket.visible = true
	Audio.play_sound(load("res://audio/sfx/772976__licorne_en_fer__ticket-machine-printing-a-ticket.wav"))



# TESTING ONLY:
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_down"):
		show_ticket()
