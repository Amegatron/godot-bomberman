extends Node2D

onready var player = $Player

func _ready():
	pass # Replace with function body.

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
