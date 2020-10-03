extends Capability

class_name PlantBombCapability

export var maxBombs : int = 1;
export var bombStrength : int = 1;

var currentBombs = [];

signal bomb_planted #TODO: bomb as argument

func _init():
	capabilityName = "PlantBomb"

func perform(args):
	print("Planting bomb")
