extends Node2D

# LevelPortal is an area collider for a pop up menu to start a level

# LevelPortal depends on LevelDialog in WorldMap
onready var level_dialog = get_node("../../LevelDialog")

# set in inspector per LevelPortal.tscn instance
export (String) var level_name # for display/ui purposes only
export (String, FILE, "*.tscn,*.scn") var level_path
export (Array, int) var level_dependencies = [0]

# set by WorldMap when loading save data
var locked: bool = false

func _ready():
	if locked: $LockedSprite.show()

func _on_Area2D_area_entered(area):
	if locked: return
	level_dialog._on_entered_level_dialog_collider(level_path)

func _on_Area2D_area_exited(area):
	if locked: return
	level_dialog._on_Dont_pressed()
