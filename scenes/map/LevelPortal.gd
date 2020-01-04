extends Node2D

# LevelPortal is an area collider for the LevelDialog to start a level

# LevelPortal depends on LevelDialog in WorldMap
onready var level_dialog = get_node("/root/WorldMap/LevelDialog")

# set in inspector per LevelPortal.tscn instance
export (String) var level_name # for display/ui purposes only
export (String, FILE, "*.tscn,*.scn") var level_path
export (Array, int) var level_dependencies = [0]

# set by WorldMap when loading save data
var locked: bool = false

func _ready():
	if locked: $LockedSprite.show()

func _on_LevelPortal_area_entered(area):
	if locked: return
	level_dialog.pop_up(level_path)

func _on_LevelPortal_area_exited(area):
	if locked: return
	level_dialog._on_Dont_pressed()
