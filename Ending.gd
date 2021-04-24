extends Node2D

func _ready():
	var Music = get_node("/root/Music")
	Music.end_music()
	$Ascension.play()
	


func _on_ColorRect_animation_finished(anim_name):
	get_tree().change_scene("res://UI/Main.tscn")
