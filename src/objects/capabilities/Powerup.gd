extends Capability

class_name PowerupCapability

var area

func perform(args):
	pass
	
func _set_owner(value):	
	._set_owner(value)
	owner.connect("custom_capability_signal", self, "_on_custom_signal")
	
func _on_custom_signal(capability, signalName, args):
	if capability.capabilityName == "AreaOfEffect" && signalName == "body_entered":
		_on_body_entered(args["body"])
	
func _on_body_entered(body):
	pass
	
func _get_sound():
	return load("res://sounds/powerup.wav")
