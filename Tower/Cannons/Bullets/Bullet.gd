extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect("body_entered", self, "hitSomething")

 
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


func hitSomething(body):
	if body.is_in_group("Terrain"):
		queue_free()
		print("free")
	elif body.is_in_group("Enemy"):
		print("hit enemy")
		queue_free()
		body.hit()
