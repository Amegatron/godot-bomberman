extends Capability

class_name TakeDamageCapability

func _init():
	capabilityName = "TakeDamage"
	
func perform(args):
	#print(owner, " took damage")
	owner.queue_death(1)
