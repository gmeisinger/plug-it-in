extends Node

# meant to run privately here -- not to be called elsewhere
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_ESCAPE:
			SaveSystem.save_data()
			get_tree().quit()