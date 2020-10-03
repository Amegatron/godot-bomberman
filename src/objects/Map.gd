extends Object

class_name Map

var map = [] setget , _get_map

var height : int setget , _get_height
var width : int setget , _get_width

const CELL_BLOCK = 1
const CELL_BRICKS = 2

func _init(w, h):
	for _w in range(w):
		map.append([])
		map[_w].resize(h)
		
	height = h
	width = w

func setCell(x, y, value):
	map[x][y] = value

func _get_map():
	return map

func _get_height():
	return height
	
func _get_width():
	return width
