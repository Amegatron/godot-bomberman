extends Object

class_name BombFactory

static func create(timeout = 5, strength = 1):
	var bomb = load("res://scenes/Bomb.tscn").instance()
	
	bomb.timeout = timeout
	
	var cap = ExplodeCapability.new()
	cap.strength = strength
	bomb.add_capability(cap)
	
	cap = BombTakeDamageCapability.new()
	bomb.add_capability(cap)
	
	return bomb
	

