extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

 
func _process(delta):
	var rect = get_viewport_rect()
	if position.y > rect.size.y:
		print("freed")
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	return
	if position.y > 0:
		queue_free()
		print("freed")
	else:
		print("Position x:")
		print(position.x)
