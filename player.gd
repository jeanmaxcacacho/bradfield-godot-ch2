extends Area2D

# to be emitted after the appropriate collisions
signal pickup
signal hurt

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
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
	# deciding on which running animation based on boolean logic
	if velocity.length() > 0:
		$AnimatedSprite2D.animation = "run"
	else:
		$AnimatedSprite2D.animation = "idle"
	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0

func start():
	set_process(true) # initialize the start of the _process(delta) calls
	position = screensize/2
	$AnimatedSprite2D.animation = "idle"

func die():
	$AnimatedSprite2D.animation = "hurt"
	set_process(false) # stop the _process(delta) calls
