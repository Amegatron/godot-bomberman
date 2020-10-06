extends Entity

class_name Explosion

onready var timer = $Timer
onready var animationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout", self, "_on_timeout")
	timer.start()
	animationPlayer.play("fadeout")
	
func _on_timeout():
	queue_free()
