extends Entity

class_name Player

var deathSound = preload("res://sounds/death.wav")

func _init():
	pass

func _ready():
	pass

func queue_death(after):
	.queue_death(after)
	var sound = OneTimeSound.new()
	sound.stream = deathSound
	sound.autoplay = true
	level.add_child(sound)
