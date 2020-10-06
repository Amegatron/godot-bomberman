extends Node2D

var player

var map

const CELL_SIZE = 64

const MAP_WIDTH = 31
const MAP_HEIGHT = 21

onready var tileMap = $TileMap
onready var entitiesContainer = $Entities
onready var camera = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	map = Map.new(MAP_WIDTH, MAP_HEIGHT)
	var generator = SimpleMapGenerator.new(map)
	generator.generate(self)

	tileMap.map = map
	spawn_player(Vector2(1, 1))
	
	camera.limit_right = MAP_WIDTH * CELL_SIZE
	camera.limit_bottom = MAP_HEIGHT * CELL_SIZE

func spawn_player(pos):
	if !player:
		player = PlayerFactory.create()
		add_entity(player, pos)
		camera.target = player
		player.connect("died", self, "_on_player_died")

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
		
	if player:
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

func _on_player_died():
	var timer = RestartTimer.new()
	timer.wait_time = 3
	timer.autostart = true
	add_child(timer)

