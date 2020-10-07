extends Object

class_name GatewayFactory

static func create():
	var gateway = load("res://scenes/Gateway.tscn").instance()
	var cap = AreaOfEffectCapability.new()
	gateway.add_capability(cap)
	return gateway
