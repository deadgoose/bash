extends Node

func _ready():
	randomize()
	var height = 600
	_create_terrain(height)
	var radius = $Tower.get_shape().radius
	$Tower.global_position = Vector2(radius, height-radius)

func _create_terrain(height):
	$Terrain.height = height
	$Terrain.flat_line()
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
