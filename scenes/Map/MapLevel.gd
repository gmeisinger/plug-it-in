extends Node2D

var complete = false
export (String) var level_name

func _ready():
	if not complete:
		$LockedSprite.show()

func _on_Area2D_area_entered(area):
	if not complete: return
	var level_dialog = get_parent().get_parent().get_node("LevelDialog")
	level_dialog.show()
	level_dialog._on_entered_level_dialog_collider(level_name)