extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (PackedScene) var bullet
export (int) var max_velocity = 2200
var tower

var unpackedBullet
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func SetTower(_tower):
	tower = _tower
	
func Fire(mouse_distance):
	if get_node('Timer').time_left != 0:
		return
	get_node('Timer').start()
	unpackedBullet = bullet.instance()
	var power = mouse_distance*max_velocity
	#print(power)
	
	unpackedBullet.set_linear_velocity(Vector2(power, 0).rotated(tower.GetRotation()))
	unpackedBullet.position = $bullet_spawn.global_position
	get_tree().root.add_child(unpackedBullet)
	
	

func _process(delta):
	pass
	#print(get_node('Timer').time_left)
#	
