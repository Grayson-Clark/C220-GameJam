extends Node2D


func _ready():
	pass

func _input(event):
	if(event is InputEventKey):
		get_tree().change_scene("res://UI/Main.tscn")
		


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://UI/Main.tscn")
