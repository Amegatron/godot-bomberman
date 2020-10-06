extends Object

class_name ExplosionFactory

const DIR_CROSS = 0
const DIR_VERTICAL = 1
const DIR_HORIZONTAL = 2

static func create(direction, duration = 0.8):
	var explosion = load("res://scenes/Explosion.tscn").instance()
	var texture
	var shape = RectangleShape2D.new()
	
	match direction:
		DIR_CROSS:
			texture = load("res://images/fire_center.png")
			shape.extents = Vector2(28, 28)
		DIR_HORIZONTAL:
			texture = load("res://images/fire_horizontal.png")
			shape.extents = Vector2(28, 20)
		DIR_VERTICAL:
			texture = load("res://images/fire_vertical.png")
			shape.extents = Vector2(20, 28)
	
	explosion.get_node("Sprite").texture = texture
	explosion.get_node("Timer").wait_time = duration
	explosion.get_node("Area2D/CollisionShape2D").shape = shape
	
	var cap = DealDamageCapability.new()
	explosion.add_capability(cap)
	
	return explosion
