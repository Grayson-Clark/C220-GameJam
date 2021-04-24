extends Node


onready var Player = load("res://Player/Player.tscn")

func _ready():
	pass

func _process(_delta):
	if not has_node("Player"):
		respawn_player()

func respawn_player():
	var player = Player.instance()
	var StartPortal = get_node_or_null("../LevelContainer").get_children()[0].get_node("LevelStart")
	if StartPortal:
		player.global_transform.origin = StartPortal.global_transform.origin
	add_child(player)
