extends Node2D


# When instancing this scene, make sure to set this CatNum variable in the inspector
# to a number 1-8   It will look for the appropriate texture to use, and also for the appropriate Dialogic
# timeline to use. Make sure when making dialogue for a cat soul you title the timeline 
# CatSoul1 or CatSoul2 or something like that
export(int) var CatNum

func _ready():
	$Sprite.texture = load("res://Level/LevelAssets/CatSouls/cat " + str(CatNum) + ".png")

# called when player is close to this CatSoul
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		var new_dialog = Dialogic.start('CatSoul' + str(CatNum))
		add_child(new_dialog)
