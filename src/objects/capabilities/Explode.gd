extends Capability

class_name ExplodeCapability

export var strength : int = 1

func _init():
	capabilityName = "Explode"
	
func _ready():
	pass # Replace with function body.

func perform(args):
	# Prevent cyclic explosion with adjacent bombs
	owner.remove_capability(capabilityName)
	owner.remove_capability("TakeDamage")
	
	var pos = owner.level.coords_to_map(owner.position)
	
	for i in range(strength):
		var testEntity = owner.level.map.getCell(Vector2(pos.x, pos.y - i - 1))
		if testEntity:
			testEntity.perform_action("TakeDamage")
			break
		else:
			var explosion = ExplosionFactory.create(ExplosionFactory.DIR_VERTICAL)
			owner.level.add_entity(explosion, Vector2(pos.x, pos.y - i - 1))

	for i in range(strength):
		var testEntity = owner.level.map.getCell(Vector2(pos.x, pos.y + i + 1))
		if testEntity:
			testEntity.perform_action("TakeDamage")
			break
		else:
			var explosion = ExplosionFactory.create(ExplosionFactory.DIR_VERTICAL)
			owner.level.add_entity(explosion, Vector2(pos.x, pos.y + i + 1))

	for i in range(strength):
		var testEntity = owner.level.map.getCell(Vector2(pos.x - i - 1, pos.y))
		if testEntity:
			testEntity.perform_action("TakeDamage")
			break
		else:
			var explosion = ExplosionFactory.create(ExplosionFactory.DIR_HORIZONTAL)
			owner.level.add_entity(explosion, Vector2(pos.x - i - 1, pos.y))
			
	for i in range(strength):
		var testEntity = owner.level.map.getCell(Vector2(pos.x + i + 1, pos.y))
		if testEntity:
			testEntity.perform_action("TakeDamage")
			break
		else:
			var explosion = ExplosionFactory.create(ExplosionFactory.DIR_HORIZONTAL)
			owner.level.add_entity(explosion, Vector2(pos.x + i + 1, pos.y))
			
	var explosion = ExplosionFactory.create(ExplosionFactory.DIR_CROSS)
	owner.level.add_entity(explosion, Vector2(pos.x, pos.y))
			
	owner.queue_free();
