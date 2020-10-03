extends TileMap

var map setget _set_map

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _set_map(map):
	for x in range(map.width):
		for y in range(map.height):
			set_cellv(Vector2(x, y), map.map[x][y])
