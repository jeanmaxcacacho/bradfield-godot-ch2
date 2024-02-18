extends Area2D

var screensize = Vector2.ZERO # idk what the fuck this means

func pickup():
	queue_free() # remove the node


# make cactus and coin not overlap; if has cactus regenerate position
func _on_area_entered(area):
	if area.is_in_group("obstacles"):
		position = Vector2(randi_range(0, screensize.x), randi_range(0, screensize.y))
