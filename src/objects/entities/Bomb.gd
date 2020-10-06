extends Entity

class_name Bomb

export var timeout : int setget _set_timeout

var timer
var isIgnored : bool = true

func _ready():
	timer = $Timer
	timer.connect("timeout", self, "_on_timeout")
	self.timeout = timeout
	$AnimationPlayer.play("bomb_idle_animation")

func _physics_process(delta):
	if isIgnored && level.player && !$CollisionShape2D.shape.collide(transform, level.player.get_node("CollisionShape2D").shape, level.player.transform):
		isIgnored = false
		level.player.remove_collision_exception_with(self)

func _set_timeout(value):
	timeout = value
	if timer:
		timer.wait_time = timeout
		timer.start()

func _on_timeout():
	print("Exploded!")
	perform_action("Explode", {})
