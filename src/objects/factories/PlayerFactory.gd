extends Object

class_name PlayerFactory

static func create():
	var player = load("res://scenes/Player.tscn").instance()
	
	var cap = MoveCapability.new()
	player.add_capability(cap)
	
	cap = PlantBombCapability.new()
	player.add_capability(cap)
	
	cap = TakeDamageCapability.new()
	player.add_capability(cap)
	
	return player
	
