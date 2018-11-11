extends Position2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal spawn
var next_spawn_time

func _generate_new_spawn_time():
	next_spawn_time = rand_range(1,3)
	
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	_generate_new_spawn_time()

func _process(delta):
	next_spawn_time -= delta
	if next_spawn_time <= 0:
		emit_signal("spawn")
		_generate_new_spawn_time()
