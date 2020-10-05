extends Object

class_name MapGenerator

var map

func _init(m):
	map = m

func generate(level):
	pass
	
func _place_grid():
	var height = map.height
	var width = map.width
	
	for w in range(width/2):
		for h in range(height/2):
			map.setCell(Vector2(w*2, h*2), BlockFactory.create())

func _place_borders():
	var height = map.height
	var width = map.width
	
	#
	# Borders
	#
	for w in range(width):
		map.setCell(Vector2(w, 0), BlockFactory.create())
		map.setCell(Vector2(w, height - 1), BlockFactory.create())
		
	for h in range(height):
		map.setCell(Vector2(0, h), BlockFactory.create())
		map.setCell(Vector2(width - 1, h), BlockFactory.create())	
