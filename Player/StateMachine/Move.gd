extends Node

onready var SM = get_parent()
onready var player = get_node("../..")

onready var prev_direction = player.direction

func _ready():
	yield(player, "ready")

func start():
	player.set_animation("Move")
	player.jump_power = Vector2.ZERO

func physics_process(_delta):
	if not player.is_on_floor():
		SM.set_state("Fall")
	else:
		player.velocity.y = 0
	if Input.is_action_just_pressed("jump") and player.has_jump:
		SM.set_state("JumpSquat")
	if player.is_moving():
		if player.direction != prev_direction:
			player.velocity.x = 0
			prev_direction = player.direction
		player.velocity += player.move_speed * player.move_vector()
		player.move_and_slide(player.velocity, Vector2.UP)
	else:
		player.velocity = Vector2.ZERO
		SM.set_state("Idle")
