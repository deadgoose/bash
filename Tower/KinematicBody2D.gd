extends KinematicBody2D


# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (float) var rotation_speed = 1.5
var target_rotation = null
var rotation_dir = 0
var cannon
export (PackedScene) var Cannon

func _ready():
	pass
	
func has_cannon():
	return not not cannon

func _FireCannon():
	if not has_cannon():
		return
	cannon.Fire()
	
func GetRotation():
	return rotation - PI/2
	
func add_cannon():
	if has_cannon():
		return
	var radius = get_node("CollisionShape2D").get_shape().radius
	cannon = Cannon.instance()
	cannon.SetTower(self)
	cannon.position = Vector2(0, -1*radius)
	add_child(cannon)
	
func get_input():
	self.target_rotation = get_global_mouse_position().angle_to_point(self.get_parent().position) + PI/2
func _physics_process(delta):
	if Input.is_action_pressed('ui_mb_r'):
		add_cannon()
	if Input.is_action_pressed('ui_mb_l'):
		_FireCannon()
	get_input()
	var to_rotate
	if self.target_rotation > rotation:
		to_rotate = rotation_speed * delta
		if rotation + to_rotate > self.target_rotation:
			to_rotate = 0
	else:
		to_rotate = rotation_speed * delta * -1
		if rotation + to_rotate < self.target_rotation:
			to_rotate = 0
	rotation += to_rotate
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
