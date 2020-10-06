extends PowerupCapability

class_name MoreBombsPowerupCapability

var bombsBonus = 1

func _init():
	capabilityName = "MoreBombsPowerup"

func _on_body_entered(body):
	._on_body_entered(body)
	if body is Player:
		var cap = body.get_capability("PlantBomb")
		if cap:
			cap.maxBombs += bombsBonus
			var sound = OneTimeSound.new()
			sound.stream = _get_sound()
			sound.autoplay = true
			owner.level.add_child(sound)
			owner.queue_death(0)
