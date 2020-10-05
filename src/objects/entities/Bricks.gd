extends Entity

class_name Bricks

onready var sprite = $AnimatedSprite

func _ready():
	pass # Replace with function body.
	
func queue_death(after):
	.queue_death(after)
	sprite.play("death")
	level.map.emit_signal("cell_changed", level.coords_to_map(position), self)
	
func _on_death_timeout():
	print("Bricks: _on_death_timeout")
	level.map.setCell(level.coords_to_map(position), null)
	._on_death_timeout()
