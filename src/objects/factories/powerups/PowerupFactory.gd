extends Object

class_name PowerupFactory

static func createMoreBombsPowerup(bonus = 1):
	var powerup = load("res://scenes/powerups/MoreBombsPowerup.tscn").instance()
	powerup.add_capability(_create_aoe())
	var cap = MoreBombsPowerupCapability.new()
	cap.bombsBonus = bonus
	powerup.add_capability(cap)
	return powerup
	
static func createMoreStrengthPowerup(bonus = 1):
	var powerup = load("res://scenes/powerups/MoreStrengthPowerup.tscn").instance()
	powerup.add_capability(_create_aoe())
	var cap = MoreStrengthPowerupCapability.new()
	cap.strengthBonus = bonus
	powerup.add_capability(cap)
	return powerup

static func _create_aoe():
	return AreaOfEffectCapability.new()
