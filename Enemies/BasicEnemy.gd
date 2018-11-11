extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (int) var velocity = 100

func hit():
	print("free enemy")
	queue_free()
	
func get_dimensions():
	return $CollisionShape2D.get_shape()
	
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):
	position.x -= velocity*delta
