extends Capability

class_name PlantBombCapability

export var maxBombs : int = 2;
export var bombStrength : int = 1;
export var bombTimeout : int = 4;

var bombCounter : int = 0

export var sound : AudioStream

func _init():
	capabilityName = "PlantBomb"

func perform(args):
	var ownerPos = owner.level.coords_to_map(owner.position)
	if bombCounter < maxBombs && owner.level.map._get_cell_type(ownerPos) == Map.CELL_EMPTY:
		bombCounter += 1
		var bomb = _plat_bomb()
		return {"bomb": bomb}
		
func _plat_bomb():
	var bomb = BombFactory.create(bombTimeout, bombStrength)
	bomb.connect("action_performed", self, "_on_bomb_action_performed")
	bomb.z_index = owner.z_index - 1
	owner.add_collision_exception_with(bomb)
	var pos = owner.level.coords_to_map(owner.position)
	owner.level.map.setCell(pos, bomb)
	owner.level.add_entity(bomb, pos)
	return bomb
	
func _on_bomb_action_performed(action, args):
	if action == "Explode" && bombCounter > 0:
		bombCounter -= 1
