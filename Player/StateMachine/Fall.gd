extends Node

onready var SM = get_parent()
onready var player = get_node("../..")

func _ready():
	yield(player, "ready")

func start():
	player.set_animation("Fall")
	player.jump_power = Vector2.ZERO

func physics_process(_delta):
	if player.is_on_floor() and player.velocity.y > 0:
		player.velocity.y = 0
		#var SFX = get_node("/root/Game/SFX")
		#SFX.play_land_SFX()
		if player.is_moving():
			SM.set_state("Move")
		else:
			SM.set_state("Idle")
		return
	if player.is_on_ceiling():
		player.velocity.y = 0
	if player.is_on_wall():
		player.velocity.x = 0
	if Input.is_action_just_pressed("jump") and player.has_jump:
		SM.set_state("JumpSquat")
		
		
	player.velocity += player.move_speed * player.move_vector() + player.gravity
	player.move_and_slide(player.velocity, Vector2.UP)
