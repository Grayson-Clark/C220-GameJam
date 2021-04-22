extends Node

onready var SM = get_parent()
onready var player = get_node("../..")
onready var smoke = get_node("Particles2D")

func _ready():
	yield(player, "ready")

func start():
	player.set_animation("JumpSquat")
	$Timer.start()


func _on_Timer_timeout():
	if not Input.is_action_pressed("jump"):
		player.shorthop = true
	else:
		smoke.position = player.position
		smoke.position.y += 20
		smoke.emitting = true
	SM.set_state("Jump")
