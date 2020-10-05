extends Resource

class_name Capability

var capabilityName := "";

var owner setget _set_owner;
var isOwnerReady := false

func _ready():
	pass # Replace with function body.

func perform(args):
	pass


func _set_owner(value):
	if owner != null:
		owner.disconnect("ready", self, "_on_owner_ready")
		owner.disconnect("action_performed", self, "_on_owner_action_performed")
		isOwnerReady = false

	owner = value
	owner.connect("ready", self, "_on_owner_ready")
	owner.connect("action_performed", self, "_on_owner_action_performed")
	isOwnerReady = owner.is_inside_tree()

func _on_owner_ready():
	isOwnerReady = true

func _on_owner_action_performed(action, args):
	pass
