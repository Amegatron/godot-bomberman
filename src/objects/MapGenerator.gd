extends Object

class_name MapGenerator

var map

func _init(m):
	m = map

func generate():
	pass
	
func _place_grid():
	var height = map.hegiht
	var width = map.width

	for w in range(width/2):
		for h in range(height/2):
			map.setCell(w*2, h*2, Map.CELL_BLOCK)

func _place_borders():
	var height = map.hegiht
	var width = map.width
	
	#
	# Borders
	#
	for w in range(width):
		map.setCell(w, 0, Map.CELL_BLOCK)
		map.setCell(w, height - 1, Map.CELL_BLOCK)
		
	for h in range(height):
		map.setCell(0, h, Map.CELL_BLOCK)
		map.setCell(width - 1, h, Map.CELL_BLOCK)	
