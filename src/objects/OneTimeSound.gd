extends AudioStreamPlayer

class_name OneTimeSound

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("finished", self, "_on_finished")

func _on_finished():
	queue_free()
