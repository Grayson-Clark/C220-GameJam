extends Node2D

var make_vis = false
onready var label = $Label

func _ready():
	if label.percent_visible != 0:
		label.percent_visible = 0

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		if Global.num_spirits >= 8:
			print("Game complete!")
			get_tree().change_scene("res://Ending.tscn")
		else:
			make_vis = true

func _process(_d):
	if make_vis:
		label.percent_visible += 0.005
