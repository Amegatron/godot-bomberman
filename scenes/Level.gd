extends Node2D

var map

func _init():
	map = Map.new(30, 20)
	var generator = SimpleMapGenerator.new(map)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
