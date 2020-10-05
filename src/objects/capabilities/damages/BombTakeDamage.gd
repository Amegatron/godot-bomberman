extends TakeDamageCapability

class_name BombTakeDamageCapability

func perform(args):
	owner.perform_action("Explode", {})
