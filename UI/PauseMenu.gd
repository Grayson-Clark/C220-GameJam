extends Control


func update_screen():
	if Global.num_spirits == 1:
		$Background1.show()
		$Background0.hide()
	elif Global.num_spirits == 2:
		$Background2.show()
		$Background1.hide()
	elif Global.num_spirits == 3:
		$Background3.show()
		$Background2.hide()
	elif Global.num_spirits == 4:
		$Background4.show()
		$Background3.hide()
	elif Global.num_spirits == 5:
		$Background5.show()
		$Background4.hide()
	elif Global.num_spirits == 6:
		$Background6.show()
		$Background5.hide()
	elif Global.num_spirits == 7:
		$Background7.show()
		$Background6.hide()
	elif Global.num_spirits == 8:
		$Background8.show()
		$Background7.hide()
	elif Global.num_spirits == 9:
		$Background9.show()
		$Background8.hide()



func _on_Resume_pressed():
	Global.pause_toggle()


func _on_Quit_pressed():
	Global.pause_toggle()
	get_tree().change_scene("res://UI/Main.tscn")
