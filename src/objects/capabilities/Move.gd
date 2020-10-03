extends Capability

class_name MoveCapability

export var speed = 200

func _init():
	capabilityName = "Move"

func perform(args):
	var vector = args["vector"]
	owner.move_and_slide(vector * speed)
