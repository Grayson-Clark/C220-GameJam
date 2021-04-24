extends Node

var num_spirits = 1
var can_move = true

func _ready():
	pass
	
func increment_num_spirits():
	num_spirits += 1
	var Music = get_node("/root/Game/Music")
	var Pause = get_node_or_null("/root/Game/UI/PauseMenu")
	Music.update_music()
	Pause.update_screen()


func _input(event):
	if Input.is_action_just_pressed("quit") and can_move:
		# if pressed quit in any scene except the main level, quit
		if get_tree().get_current_scene().get_name() != "Game":
			get_tree().quit()
		# otherwise, pause the game
		else:
			pause_toggle()




func pause_toggle():
	get_tree().paused = not get_tree().paused
	var PauseMenu = get_node_or_null("/root/Game/UI/PauseMenu")
	if PauseMenu:
		PauseMenu.visible = not PauseMenu.visible
