extends Camera2D

func _process(_delta):
	var player = get_node_or_null("../PlayerContainer/Player")
	if player != null:
		position = player.position
		force_update_scroll()
