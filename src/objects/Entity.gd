extends KinematicBody2D

class_name Entity

# Array of initial capabilities set from the editor. Not used directly
export(Array, Resource) var capabilities := [];

# Dictionary of capabilities
var capabilitiesDict := {}
var deferredRemoveCapabilites := {}

func _init():
	pass
	
func _process(delta):
	_remove_deferred_capabilities()
	
func _ready():
		# Fill the dictionary for quicker further access
	for cap in capabilities:
		cap.owner = self
		capabilitiesDict[cap.capabilityName] = cap

func add_capability(cap):
	var testCap = get_capability(cap.capabilityName)
	if testCap != null:
		return
		
	cap.owner = self
	capabilitiesDict[cap.capabilityName] = cap
	
func remove_capability(name):
	if capabilitiesDict.has(name):
		capabilitiesDict.erase(name)
		
func defer_remove_capability(name):
	deferredRemoveCapabilites[name] = true
		
func _remove_deferred_capabilities():
	for key in deferredRemoveCapabilites:
		remove_capability(key)
		
	deferredRemoveCapabilites.clear()

func get_capability(name):
	if capabilitiesDict.has(name):
		return capabilitiesDict[name]
	else:
		return null
	
func perform_action(action, args := {}):
	var cap = get_capability(action)
	if cap != null:
		cap.perform(args);
