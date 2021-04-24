extends Node

onready var SM = get_parent()
onready var player = get_node("../..")

func _ready():
	yield(player, "ready")

func start():
	player.velocity = Vector2(0,1.0)
	player.set_animation("Idle")

func physics_process(_delta):
	if not Global.can_move:
		return
	if not player.is_on_floor():
		SM.set_state("Fall")
	if player.is_moving():
		SM.set_state("Move")
	if Input.is_action_just_pressed("jump") and player.has_jump:
		SM.set_state("JumpSquat")
