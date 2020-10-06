extends Entity

class_name Player

onready var deathSound = $DeathSound
onready var plantBombSound = $PlantBombSound

func _init():
	pass

func _ready():
	connect("action_performed", self, "action_performed")

func queue_death(after):
	.queue_death(after)
	deathSound.play()

func action_performed(action, args):
	if action == "PlantBomb" && args:
		plantBombSound.play()
