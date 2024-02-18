extends Node

@export var coin_scene : PackedScene # what does this do?
@export var cack2s_scene : PackedScene
@export var playtime = 30

var level = 1
var score = 0
var time_left = 0
var screensize = Vector2.ZERO
var playing = false

func _ready():
	screensize = get_viewport().get_visible_rect().size
	$Player.screensize = screensize
	$Player.hide()
	
	
func _process(_delta):
	if playing and get_tree().get_nodes_in_group("coins").size() == 0:
		level += 1
		time_left += 5
		spawn_coins()

func new_game():
	playing = true
	level = 1
	score = 0
	time_left = playtime
	$Player.start()
	$Player.show()
	$GameTimer.start()
	spawn_coins()
	spawn_cack2s()
	$HUD.update_score(score)
	$HUD.update_timer(time_left)
	
	
func spawn_coins():
	for i in level + 4:
		var c = coin_scene.instantiate()
		add_child(c)
		c.screensize = screensize
		c.position = Vector2(randi_range(0, screensize.x), randi_range(0, screensize.y))
		
		
func spawn_cack2s():
	var i = 0
	while i < 2:
		var cack2s = cack2s_scene.instantiate()
		add_child(cack2s)
		cack2s.screensize = screensize
		cack2s.position = Vector2(randi_range(0, screensize.x), randi_range(0, screensize.y))
		i += 1


func _on_game_timer_timeout():
	time_left -= 1
	$HUD.update_timer(time_left)
	if time_left <= 0:
		game_over()


func _on_player_pickup():
	score += 1
	$HUD.update_score(score)


func _on_player_hurt():
	game_over()
	

func game_over():
	playing = false
	$GameTimer.stop()
	get_tree().call_group("coins", "queue_free")
	$HUD.show_game_over()
	$Player.die()


func _on_hud_start_game():
	new_game()
