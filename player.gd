extends Area2D

@export var speed = 350
var velocity = Vector2.ZERO # speed and direction?
var screensize = Vector2(480, 720) # I think this is to define bounds of where player can move

# sometimes I think about ending it all with a belt
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# things that should happen in the game loop
func _process(delta):
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += velocity * speed * delta # when the fuck was this variable initialized???????
