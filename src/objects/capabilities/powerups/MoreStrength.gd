extends PowerupCapability

class_name MoreStrengthPowerupCapability

var strengthBonus = 1

func _init():
	capabilityName = "MoreStrengthPowerup"

func _on_body_entered(body):
	._on_body_entered(body)
	if body is Player:
		var cap = body.get_capability("PlantBomb")
		if cap:
			cap.bombStrength += strengthBonus
			var sound = OneTimeSound.new()
			sound.stream = _get_sound()
			sound.autoplay = true
			owner.level.add_child(sound)
			owner.queue_death(0)
