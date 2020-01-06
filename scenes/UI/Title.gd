extends Control

const WORLD_MAP = "res://scenes/map/WorldMap.tscn"

func _on_SaveMenu_id_pressed(id):
	# load the selected save game - probably the only call?
	SaveSystem.load_data(id)
	# NOTE: This title screen entry point is the only time we
	#       set the SceneLoader's "private" var _current_scene
	SceneLoader._current_scene = self
	SceneLoader.load_scene(WORLD_MAP)

func _on_Quit_pressed():
	get_tree().quit()
