extends Timer

class_name RestartTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("timeout", self, "_timeout")
	
func _timeout():
	get_tree().reload_current_scene()
