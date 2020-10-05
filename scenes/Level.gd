extends Node2D

var playerResource = preload("res://scenes/Player.tscn")
var player

var map

const CELL_SIZE = 64

onready var tileMap = $TileMap
onready var entitiesContainer = $Entities

# Called when the node enters the scene tree for the first time.
func _ready():
	map = Map.new(30, 20)
	var generator = SimpleMapGenerator.new(map)
	generator.generate(self)

	tileMap.map = map
	player = playerResource.instance()
	player.position = Vector2(96, 96)
	player.level = self
	entitiesContainer.add_child(player)

func _physics_process(delta):
	var moveVector := Vector2()
	
	if Input.is_action_pressed("ui_down"):
		moveVector.y += 1
	if Input.is_action_pressed("ui_up"):
		moveVector.y -= 1
	if Input.is_action_pressed("ui_left"):
		moveVector.x -= 1
	if Input.is_action_pressed("ui_right"):
		moveVector.x += 1
		
	if moveVector.length() > 0:
		player.perform_action("Move", { "vector": moveVector.normalized() })
		
	if Input.is_action_just_pressed("ui_accept"):
		player.perform_action("PlantBomb")
		
func map_coords_to_global(pos):
	return Vector2((pos.x + 0.5) * CELL_SIZE, (pos.y + 0.5) * CELL_SIZE)

func coords_to_map(pos):
	return Vector2(floor(pos.x / float(CELL_SIZE)), floor(pos.y / float(CELL_SIZE)))

func add_entity(entity, pos):
	entity.position = map_coords_to_global(pos)
	entity.level = self
	entitiesContainer.add_child(entity)
