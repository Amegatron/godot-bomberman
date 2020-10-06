extends Capability

class_name TakeDamageCapability

func _init():
	capabilityName = "TakeDamage"
	
func perform(args):
	owner.queue_death(1)
	# TODO: make damage cool-down
	owner.defer_remove_capability(capabilityName)
