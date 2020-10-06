extends KinematicBody2D

class_name Entity

# Array of initial capabilities set from the editor. Not used directly
export(Array, Resource) var capabilities := [];

# Dictionary of capabilities
var capabilitiesDict := {}
var deferredRemoveCapabilites := {}

var level

var isDead := false

signal action_performed(action, args)
signal died
signal dying
signal custom_capability_signal(capability, signalName, args)

var beforeActionCallbacks := {}

func _init():
	pass
	
func _process(delta):
	_remove_deferred_capabilities()
	
func _ready():
		# Fill the dictionary for quicker further access
	for cap in capabilities:
		cap.owner = self
		capabilitiesDict[cap.capabilityName] = cap

func emit_capability_signal(capability, signalName, args):
	print("custom_capability_signal: ", signalName, ", from: ", capability)
	emit_signal("custom_capability_signal", capability, signalName, args)
	
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
	if !_check_before_action_callbacks(action, args):
		return
		
	if isDead:
		return
	
	var cap = get_capability(action)
	if cap != null:
		var ret = cap.perform(args);
		emit_signal("action_performed", action, ret)

func _check_before_action_callbacks(action, args):
	if !beforeActionCallbacks.has(action):
		return true
		
	var result = true
	for i in beforeActionCallbacks[action]:
		if beforeActionCallbacks[action][i].call_func(action, args):
			result = false
			break
	
	return result
	
func add_before_action_callback(action, funcRef):
	if !beforeActionCallbacks.has(action):
		beforeActionCallbacks[action] = {}
		
	beforeActionCallbacks[action][funcRef] = true

func remove_before_action_callback(action, funcRef):
	if beforeActionCallbacks.has(action):
		beforeActionCallbacks[action].erase(funcRef)

var deathTimer

# TODO: refactor death (make separate action)
func queue_death(after):
	isDead = true
	
	# Default death animation
	if has_node("AnimationPlayer"):
		var anim = get_node("AnimationPlayer")
		if anim.has_animation("death"):
			anim.play("death")
			
	emit_signal("dying")
	
	if after > 0:
		deathTimer = Timer.new()
		deathTimer.wait_time = after
		deathTimer.connect("timeout", self, "_on_death_timeout")
		level.add_child(deathTimer)
		deathTimer.start()
	else:
		_on_death_timeout()

func _on_death_timeout():
	if deathTimer:
		deathTimer.queue_free()
	queue_free()
	emit_signal("died")
