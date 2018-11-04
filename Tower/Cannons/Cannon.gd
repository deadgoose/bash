extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (PackedScene) var bullet
export (int) var max_velocity = 1500
var tower
var max_length

var unpackedBullet
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	max_length = get_viewport_rect().size.x
	
func SetTower(_tower):
	tower = _tower
	
func Fire():
	if get_node('Timer').time_left != 0:
		return
	get_node('Timer').start()
	unpackedBullet = bullet.instance()
	var distance_to_mouse = get_global_mouse_position().distance_to($bullet_spawn.global_position)
	var power = (distance_to_mouse/max_length)*max_velocity
	print(distance_to_mouse)
	print(power)
	
	unpackedBullet.set_linear_velocity(Vector2(power, 0).rotated(tower.GetRotation()))
	unpackedBullet.position = $bullet_spawn.global_position
	get_tree().root.add_child(unpackedBullet)
	
	

func _process(delta):
	pass
	#print(get_node('Timer').time_left)
#	
