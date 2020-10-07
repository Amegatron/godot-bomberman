extends Capability

class_name PlantBombCapability

export var maxBombs : int = 1;
export var bombStrength : int = 1;
export var bombTimeout : int = 3.5;

var bombCounter : int = 0

export var sound : AudioStream
var audioPlayer : AudioStreamPlayer

func _init():
	capabilityName = "PlantBomb"

func perform(args):
	var ownerPos = owner.level.coords_to_map(owner.position)
	if bombCounter < maxBombs && owner.level.map._get_cell_type(ownerPos) == Map.CELL_EMPTY:
		bombCounter += 1
		var bomb = _plat_bomb()
		return bomb
		
func _plat_bomb():
	var bomb = BombFactory.create(bombTimeout, bombStrength)
	bomb.connect("action_performed", self, "_on_bomb_action_performed")
	bomb.z_index = owner.z_index - 1
	owner.add_collision_exception_with(bomb)
	var pos = owner.level.coords_to_map(owner.position)
	owner.level.map.setCell(pos, bomb)
	owner.level.add_entity(bomb, pos)
	if audioPlayer:
		audioPlayer.play()
		
	return bomb
	
func _on_bomb_action_performed(action, args):
	if action == "Explode" && bombCounter > 0:
		bombCounter -= 1

func _set_owner(value):
	if audioPlayer:
		audioPlayer.queue_free()
		
	._set_owner(value)
	audioPlayer = AudioStreamPlayer.new()
	audioPlayer.stream = sound
	owner.add_child(audioPlayer)
