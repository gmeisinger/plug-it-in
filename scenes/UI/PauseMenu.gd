extends Control

# quit from anywhere - handles escape key for now

const TITLE_SCREEN = 'res://scenes/UI/Title.tscn'
const WORLD_MAP = 'res://scenes/map/WorldMap.tscn'

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_ESCAPE:
			if visible:
				leave_pause_menu()
			elif has_node('/root/Title'):
				get_tree().quit()
			else: # in levels and world map
				enter_pause_menu()

func enter_pause_menu():
	_check_world_map()
	_ensure_on_top()
	$AnimationPlayer.play('Pop')

func leave_pause_menu():
	$AnimationPlayer.play_backwards('Pop')

func _ensure_on_top():
	get_tree().get_root().move_child(self, get_tree().get_root().get_child_count())

func _check_world_map():
	if has_node('/root/WorldMap'):
		$'Panel/VBoxContainer/WorldMapButton'.hide()
	else:
		$'Panel/VBoxContainer/WorldMapButton'.show()

func _on_Resume_pressed():
	leave_pause_menu()

func _on_World_Map_pressed():
	leave_pause_menu()
	yield($AnimationPlayer, 'animation_finished')
	SceneLoader.load_scene(WORLD_MAP)

func _on_Quit_pressed():
	leave_pause_menu()
	yield($AnimationPlayer, 'animation_finished')
	SceneLoader.load_scene(TITLE_SCREEN)
