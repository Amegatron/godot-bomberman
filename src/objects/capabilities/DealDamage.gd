extends Capability

class_name DealDamageCapability

func _set_owner(value):
	if owner != null:
		owner.get_node("Area2D").disconnect("body_entered", self, "_on_entity_enetered")
		
	._set_owner(value)
	
	owner.get_node("Area2D").connect("body_entered", self, "_on_entity_enetered")
	
func _on_entity_enetered(body):
	if body is Entity and !body.isDead:
		body.perform_action("TakeDamage")
