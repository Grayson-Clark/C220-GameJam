extends Node2D


# When instancing this scene, make sure to set this CatNum variable in the inspector
# to a number 1-8   It will look for the appropriate texture to use, and also for the appropriate Dialogic
# timeline to use. Make sure when making dialogue for a cat soul you title the timeline 
# CatSoul1 or CatSoul2 or something like that
export(int) var CatNum
# if this sprite should be facing left. Need to do it this way to make sure dialogic stuff isn't flipped around
export var isSpriteFlipped = false

var die = false

onready var shader = get_node("Sprite").material
onready var UI = get_node("/root/Game/UI")

func _ready():
	if isSpriteFlipped:
		$Sprite.flip_h = true
	var tex_path = "res://Level/LevelAssets/CatSouls/cat " + str(CatNum) + ".png"
	$Sprite.texture = load(tex_path)

# called when player is close to this CatSoul
func _on_Area2D_body_entered(body):
	if body.name == "Player" and Global.can_move:
		$Area2D.queue_free()
		var new_dialog = Dialogic.start('CatSoul' + str(CatNum))
		UI.add_child(new_dialog)
		Global.increment_num_spirits()
		var SFX = get_node("/root/Game/SFX")
		SFX.play_spirit_meow_SFX()
		new_dialog.connect("event_end", self, "die")
		#new_dialog.connect("event_start", self, "dialogue_start")
		Global.can_move = false

func _process(delta):
	if die:
		var dissolve = shader.get_shader_param("dissolve_value")
		if dissolve > 0:
			shader.set_shader_param("dissolve_value", dissolve - 0.01)
		else:
			queue_free()

func die(type):
	Global.can_move = true
	die = true
	
