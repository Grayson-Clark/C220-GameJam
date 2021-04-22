extends Camera2D

onready var shad = get_parent().get_node("ColorRect")

func _process(_delta):
	var player = get_node_or_null("../PlayerContainer/Player")
	if player != null:
		position = player.position
