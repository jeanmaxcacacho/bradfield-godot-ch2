extends Area2D

var screensize = Vector2.ZERO # idk what the fuck this means

func pickup():
	queue_free() # remove the node
