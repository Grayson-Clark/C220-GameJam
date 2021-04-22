extends KinematicBody2D

onready var SM = $StateMachine

var velocity = Vector2.ZERO
var jump_power = Vector2.ZERO
var direction = 1 # 1 is facing right, -1 is facing left

export var gravity = Vector2(0,30)

export var move_speed = 20
export var max_move = 300

export var jump_speed = 100 # vertical jump "power"
export var max_jump = 1000

export var leap_speed = 100 # horizontal jump "power"
export var max_leap = 1000

var has_jump = true


func _ready():
	pass

func _physics_process(_delta):
	velocity.x = clamp(velocity.x,-max_move,max_move)
	print(has_jump)
	
	if is_on_floor() and not has_jump:
		has_jump = true


func is_moving():
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		return true
	return false

func move_vector():
	return Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"),0.0)

func _unhandled_input(event):
	if event.is_action_pressed("left"):
		direction = -1
	if event.is_action_pressed("right"):
		direction = 1

func set_animation(anim):
	if $AnimatedSprite.animation == anim: return
	if $AnimatedSprite.frames.has_animation(anim): $AnimatedSprite.play(anim)
	else: $AnimatedSprite.play()
