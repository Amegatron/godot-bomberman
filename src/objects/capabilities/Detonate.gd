extends Capability

class_name DetonateCapability

var plantBombCapability : PlantBombCapability setget _set_plant_capability;

func _init():
	capabilityName = "Detonate"

func _ready():
	pass # Replace with function body.

func perform(args):
	pass

func _set_plant_capability(value):
	if plantBombCapability != null:
		plantBombCapability.disconnect("bomb_planted", self, "_on_bomb_planted")
	
	plantBombCapability = value
	plantBombCapability.connect("bomb_planted", self, "_on_bomb_planted")
	
func _on_bomb_planted():
	#TODO: impleent bomb queue
	pass
