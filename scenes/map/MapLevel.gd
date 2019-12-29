extends Node2D

# MapLevel depends on LevelDialog in WorldMap
onready var level_dialog = get_node("../../LevelDialog")

# set in inspector per MapLevel.tscn instance
export (String) var level_name # for display/ui purposes only
export(String, FILE, "*.tscn,*.scn") var level_path
export (Array, int) var level_dependencies = [0]

var locked: bool = true

func _ready():
	if locked:
		$LockedSprite.show()

func _on_Area2D_area_entered(area):
	if locked: return
	level_dialog._on_entered_level_dialog_collider(level_path)

func _on_Area2D_area_exited(area):
	if locked: return
	level_dialog._on_Dont_pressed()
