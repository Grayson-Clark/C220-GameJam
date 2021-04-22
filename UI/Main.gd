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
		



func _on_Play_pressed():
	$Play_Timer.start()
	$Nothing_Pressed.hide()
	$Play_Pressed.show()


func _on_Quit_pressed():
	$Quit_Timer.start()
	$Nothing_Pressed.hide()
	$Quit_Pressed.show()


func _on_Play_Timer_timeout():
	play = true


func _on_Quit_Timer_timeout():
	quit = true
