extends Control

# Exists only in levels and world map

const TITLE_SCREEN = "res://scenes/ui/Title.tscn"
const WORLD_MAP = "res://scenes/map/WorldMap.tscn"

func check_world_map():
	if get_node('/root/WorldMap'):
		$"VBoxContainer/World Map".hide()
	else:
		$"VBoxContainer/World Map".show()

func leave_pause_menu():
	$AnimationPlayer.play_backwards("Pop")
	yield($AnimationPlayer, "animation_finished")

func _on_Quit_pressed():
	leave_pause_menu()
	SceneLoader.load_scene(TITLE_SCREEN)
	self.queue_free()

func _on_World_Map_pressed():
	leave_pause_menu()
	SceneLoader.load_scene(WORLD_MAP)
