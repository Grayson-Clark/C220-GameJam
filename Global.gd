extends Node



func _ready():
	pass


func _input(event):
	if Input.is_action_just_pressed("quit"):
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
