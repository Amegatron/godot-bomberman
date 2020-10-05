extends Object

class_name BricksFactory

static func create():
	var bricks = load("res://scenes/Bricks.tscn").instance()
	var damageCap = TakeDamageCapability.new()
	bricks.add_capability(damageCap)
	return bricks
