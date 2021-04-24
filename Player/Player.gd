extends KinematicBody2D

onready var SM = $StateMachine
onready var Footstep = $Running

var velocity = Vector2.ZERO
var jump_power = Vector2.ZERO
var direction = 1 # 1 is facing right, -1 is facing left

export var gravity = Vector2(0,30)

export var move_speed = 20 # horizontal "walk" speed
export var max_move = 300

export var jump_speed = 750 # vertical jump "power"
export var max_jump = 1000

export var leap_speed = 80 # horizontal jump "power"
export var max_leap = 1000

var shorthop = false

var has_jump = true


func _ready():
	pass

func _physics_process(_delta):
	velocity.x = clamp(velocity.x,-max_move,max_move)
	
	if is_on_floor() and not has_jump:
		has_jump = true
		
		
	# FOR DEBUGGING / TESTING
	if Global.debug and Input.is_action_pressed("ui_accept"):
		velocity.x += move_vector().x * 500
		velocity.y -= Input.get_action_strength("jump") * 200
	
	# FOOTSTEP SOUND EFFECTS (Not working correctly atm)
	#if velocity.x != 0 and is_on_floor():
	#	if !Footstep.playing:
	#		Footstep.play()
	#elif Footstep.playing:
	#	Footstep.stop()

func is_moving():
	if (Input.is_action_pressed("left") or Input.is_action_pressed("right")) and Global.can_move:
		return true
	return false

func move_vector():
	if not Global.can_move:
		return Vector2.ZERO
	return Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"),0.0)

func _unhandled_input(event):
	if not Global.can_move:
		return
	if event.is_action_pressed("left"):
		$AnimatedSprite.flip_h = true
		direction = -1
	if event.is_action_pressed("right"):
		$AnimatedSprite.flip_h = false
		direction = 1

func set_animation(anim):
	if $AnimatedSprite.animation == anim: return
	if $AnimatedSprite.frames.has_animation(anim): $AnimatedSprite.play(anim)
	else: $AnimatedSprite.play()
