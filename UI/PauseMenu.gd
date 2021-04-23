extends Control


func _ready():
	if Global.num_spirits == 1:
		$Background1.visible = true
		$Background0.visible = false
	elif Global.num_spirits == 2:
		$Background2.visible = true
		$Background1.visible = false
	elif Global.num_spirits == 3:
		$Background3.visible = true
		$Background2.visible = false
	elif Global.num_spirits == 4:
		$Background4.visible = true
		$Background3.visible = false
	elif Global.num_spirits == 5:
		$Background5.visible = true
		$Background4.visible = false
	elif Global.num_spirits == 6:
		$Background6.visible = true
		$Background5.visible = false
	elif Global.num_spirits == 7:
		$Background7.visible = true
		$Background6.visible = false
	elif Global.num_spirits == 8:
		$Background8.visible = true
		$Background7.visible = false
	elif Global.num_spirits == 9:
		$Background9.visible = true
		$Background8.visible = false



func _on_Resume_pressed():
	Global.pause_toggle()


func _on_Quit_pressed():
	Global.pause_toggle()
	get_tree().change_scene("res://UI/Main.tscn")
