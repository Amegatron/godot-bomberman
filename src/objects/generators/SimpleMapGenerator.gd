extends MapGenerator

class_name SimpleMapGenerator

var bricksPercentage := 10
var mapSeed : int setget _set_seed

func _init(m).(m):
	pass

func generate(level):
	_place_borders()
	_place_grid()
	
	var bricksAmount = floor(map.width * map.height * bricksPercentage / 100);
	print("bricksAmount == ", bricksAmount)
	
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
			var x = randi() % map.width
			var y = randi() % map.height
			
			# Make sure upper-left corder is free from bricks
			if x == 1 && y == 1 || x == 1 && y == 2 || x == 2 && y == 1:
				continue
			
			if map._get_cell_type(Vector2(x, y)) == Map.CELL_EMPTY:
				var bricks = BricksFactory.create()
				bricks.level = level
				# bricks.position = Vector2(x, y)
				map.setCell(Vector2(x, y), bricks)
				level.add_entity(bricks, Vector2(x, y))
				break
						
func _set_seed(value):
	mapSeed = value
