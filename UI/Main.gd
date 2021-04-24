extends Control

var play = false
var quit = false

func _physics_process(delta):
	if play:
		play = false
		get_tree().change_scene("res://Game.tscn")
	if quit:
		quit = false
		get_tree().quit()

func _ready():
	$Hidden_Button.disabled = true
	Global.start_music()

func _on_Play_pressed():
	if Dialogic.get_variable("PlayerName").empty():
		$CatName.show()
	else:
		print("Cat name: ", Dialogic.get_variable("PlayerName"))
		$Camera2D.add_trauma(.3)
		$earthquake.play()
		$Play_Timer.start()
		$Nothing_Pressed.hide()
		$Play_Pressed.show()


func _on_Quit_pressed():
	$Camera2D.add_trauma(.3)
	$earthquake.play()
	$Quit_Timer.start()
	$Nothing_Pressed.hide()
	$Quit_Pressed.show()


func _on_Play_Timer_timeout():
	play = true


func _on_Quit_Timer_timeout():
	quit = true


func _on_Mouth_Button_pressed():
	$Nothing_Pressed.hide()
	$CAT.show()
	$Play.disabled = true
	$Quit.disabled = true
	$Mouth_Button.disabled = true
	$Hidden_Button.disabled = false
	$Hidden_Button.show()
	


func _on_Hidden_Button_pressed():
	get_tree().quit()


func _on_Finish_pressed():
	var catname = $"CatName/LineEdit".get_text()
	Dialogic.get_definitions()['variables'].push_back({'name': 'PlayerName'})
	Dialogic.set_variable("PlayerName", catname)
	var d = Dialogic.new()
	d.save_definitions()
	$CatName.hide()
