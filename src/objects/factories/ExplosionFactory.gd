extends Object

class_name ExplosionFactory

const DIR_CROSS = 0
const DIR_VERTICAL = 1
const DIR_HORIZONTAL = 2

static func create(direction, duration = 1):
	var explosion = load("res://scenes/Explosion.tscn").instance()
	var texture
	match direction:
		DIR_CROSS:
			texture = load("res://fire_center.png")
		DIR_HORIZONTAL:
			texture = load("res://fire_horizontal.png")
		DIR_VERTICAL:
			texture = load("res://fire_vertical.png")
	
	explosion.get_node("Area2D").get_node("Sprite").texture = texture
	explosion.get_node("Timer").wait_time = duration
	
	return explosion
