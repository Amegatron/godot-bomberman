extends TileMap

var map setget _set_map

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _set_map(value):
	if self.map != null:
		self.map.disconnect("cell_changed", self, "_on_cell_changed")
		
	map = value
	for x in range(map.width):
		for y in range(map.height):
			_update_tile(Vector2(x, y))
			
	map.connect("cell_changed", self, "_on_cell_changed")

func _on_cell_changed(pos, value):
	_update_tile(pos)
	print("Cell changed: ", pos)
	
func _update_tile(pos):
	match map._get_cell_type(pos):
		Map.CELL_ENTITY:
			var entity = map.map[pos.x][pos.y]
			if entity is Block:
				set_cellv(pos, 0)
#			elif entity is Bricks:
#				if !entity.isDead:
#					set_cellv(pos, 1)
#				else:
#					set_cellv(pos, 2)
		_:
			set_cellv(pos, -1)
