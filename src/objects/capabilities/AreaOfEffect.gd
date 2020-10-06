extends Capability

class_name AreaOfEffectCapability

var area

func _init():
	capabilityName = "AreaOfEffect"

func perform(_args):
	pass
	
func _set_owner(value):	
	._set_owner(value)
	area = Area2D.new()
	area.name = "AreaOfEffect"
	var collisionShape = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	shape.extents = Vector2(10, 10)
	collisionShape.shape = shape
	area.add_child(collisionShape)
	area.connect("body_entered", self, "_on_body_entered")
	owner.add_child(area)

func _on_body_entered(body):
	owner.emit_capability_signal(self, "body_entered", {"body": body})
