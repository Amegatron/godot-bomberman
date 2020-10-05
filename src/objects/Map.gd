extends Object

class_name Map

var map = [] setget , _get_map

var height : int setget , _get_height
var width : int setget , _get_width

const CELL_EMPTY = 0
const CELL_ENTITY = 1

signal cell_changed(pos, value)

func _init(w, h):
	for _w in range(w):
		map.append([])
		map[_w].resize(h)
		
	height = h
	width = w
	
	for i in range(width):
		for j in range(height):
			map[i][j] = null
			
func setCell(pos, value):
	map[pos.x][pos.y] = value
	emit_signal("cell_changed", pos, value)
	
func getCell(pos):
	return map[pos.x][pos.y]
	
func _get_map():
	return map

func _get_height():
	return height
	
func _get_width():
	return width
	
func _add_static_entity(entity, pos):
	if _get_cell_type(pos) == CELL_EMPTY:
		setCell(pos, entity)
	
func _get_cell_type(pos):
	if !map[pos.x][pos.y]:
		return CELL_EMPTY
	else:
		return CELL_ENTITY
