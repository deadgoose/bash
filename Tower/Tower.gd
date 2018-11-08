extends Position2D

func get_shape():
	return $KinematicBody2D/CollisionShape2D.get_shape()
