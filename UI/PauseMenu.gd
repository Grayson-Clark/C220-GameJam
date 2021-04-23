extends Control


func _on_Resume_pressed():
	Global.pause_toggle()


func _on_Quit_pressed():
	Global.pause_toggle()
	get_tree().change_scene("res://UI/Main.tscn")
