extends Capability

class_name SpawnOnDeathCapability

var target

func perform(args):
	pass
	
func _set_owner(value):
	if owner:
		owner.disconnect("dying", self, "_on_owner_dying")
		
	._set_owner(value)
	
	owner.connect("dying", self, "_on_owner_dying")
	
func _on_owner_dying():
	var pos = owner.level.coords_to_map(owner.position)
	target.z_index = owner.z_index - 1
	owner.level.add_entity(target, pos)
