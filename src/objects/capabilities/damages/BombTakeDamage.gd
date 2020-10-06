extends TakeDamageCapability

class_name BombTakeDamageCapability

func perform(args):
	# Small delay when exploding in chain
	var timer = Timer.new()
	timer.wait_time = 0.1
	timer.connect("timeout", self, "_on_timeout")
	timer.autostart = true
	owner.add_child(timer)

func _on_timeout():
	owner.perform_action("Explode", {})
