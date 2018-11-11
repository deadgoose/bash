extends Node

export (PackedScene) var BasicEnemy
var next_enemy 

func _ready():
	randomize()
	#create terrain and tower
	var height = 600
	_create_terrain(height)
	var radius = $Tower.get_shape().radius
	$Tower.global_position = Vector2(radius, height-radius)
	
	#add enemy spawner
	var screensize = get_viewport().get_visible_rect().size
	next_enemy = BasicEnemy.instance()
	var enemy_dimensions = next_enemy.get_dimensions()
	$EnemySpawner.position = Vector2(screensize.x - enemy_dimensions.extents.x, height - enemy_dimensions.extents.y)

func _create_terrain(height):
	$Terrain.height = height
	$Terrain.flat_line()
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_EnemySpawner_spawn():
	var enemy = next_enemy
	enemy.position = $EnemySpawner.position
	add_child(enemy)
	next_enemy = BasicEnemy.instance()
