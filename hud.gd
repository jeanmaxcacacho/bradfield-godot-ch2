extends CanvasLayer

signal start_game

func update_score(value):
	$scoreAndTime/scoreContainer/Score.text = str(value)
	
	
func update_timer(value):
	$scoreAndTime/timeContainer/Time.text = str(value)


func show_message(text):
	$Message.text = text
	$Message.show()
	$Timer.start()


func _on_timer_timeout():
	$Message.hide()
