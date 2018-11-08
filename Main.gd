extends Node

func _ready():
	randomize()
	_create_terrain()

func _create_terrain():
	$Terrain.left_start = 2*$Tower.get_shape().radius
	$Terrain.height = 450
	$Terrain.init_line()
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
