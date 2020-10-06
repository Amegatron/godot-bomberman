extends Camera2D

var target setget _set_target

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	if target:
#		var dist = position.distance_to(target.position)
#		if dist > 200:
#			position = lerp(position, target.position, 200 / dist)
		position = target.position

func _set_target(value):
	target = value
