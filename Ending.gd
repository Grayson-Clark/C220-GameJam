extends Node2D

func _ready():
	var Music = get_node("/root/Music")
	Music.end_music()
