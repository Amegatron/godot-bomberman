extends MapGenerator

class_name SimpleMapGenerator

var bricksPercentage := 20
var mapSeed : int setget _set_seed

func generate():
	_place_borders()
	_place_grid()
	
	var bricksAmount = floor(map.width * map.height * bricksPercentage / 100);
	
	if !mapSeed:
		randomize()
	else:
		rand_seed(mapSeed)
		
	for i in range(bricksAmount):
		var cnt := 0
		while true:
			cnt += 1
			if cnt >= 100:
				print("Too many brick placement attempts")
				break

			# Bricks can only be on odd coordinates
			var x = (randi() % (map.width / 2)) * 2 + 1
			var y = (randi() % (map.height / 2)) * 2 + 1
			
			# Make sure upper-left corder is free from bricks
			if x == 1 && y == 1 || x == 1 && y == 2 || x == 2 && y == 1:
				continue
			
			if map.map[x][y] != Map.CELL_BLOCK && map.map[x][y] != Map.CELL_BRICKS:
				map.setCell(x, y, Map.CELL_BRICKS)
				break
						
func _set_seed(value):
	mapSeed = value
