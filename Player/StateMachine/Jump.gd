extends Node

onready var SM = get_parent()
onready var player = get_node("../..")

func _ready():
	yield(player, "ready")

func start():
	player.has_jump = false
	player.set_animation("Jump")
	player.jump_power = Vector2.ZERO
	
	# if in midair
	if not player.is_on_floor():
		player.velocity += player.move_speed * player.move_vector() + player.gravity
		player.move_and_slide(player.velocity, Vector2.UP)
		
	# if we are moving, increase horizontal jump power
	if player.is_moving():
		player.jump_power.x = clamp(player.jump_power.x + (player.move_vector().x * player.leap_speed), -player.max_leap, player.max_leap)

	# set vertical jump power
	player.jump_power.y = clamp(player.jump_power.y - player.jump_speed, -player.max_jump, 0)
	
	# set vertical velocity to 0
	player.velocity.y = 0
	# add vertical and horizontal jump power to velocity
	player.velocity += player.jump_power
	
	if player.shorthop:
		player.velocity.y /= 1.8
		player.velocity.x *= 1.4
		player.shorthop = false
	else:
		var SFX = get_node("/root/Game/SFX")
		SFX.play_jump_SFX()
	
	# apply velocity and transition to fall
	player.move_and_slide(player.velocity, Vector2.UP)
	SM.set_state("Fall")
