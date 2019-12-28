extends Control

# 2 buttons: go and don't -- But maybe should have continue/restart if you quit mid level

const LEVELS_DIR = 'res://Scenes/levels'
export(String) var level_to_load # should be passed when created via script (collision or selection with mouse?)

# called to pop up this node
func _on_entered_level_dialog_collider(level: String):
	$AnimationPlayer.play("Pop")
	level_to_load = level

func _on_Go_pressed():
	print('go pressed')
	$AnimationPlayer.play_backwards("Pop")
	# TODO: use ResourceInteractiveLoader and use a loading screen
	# https://docs.godotengine.org/en/3.1/tutorials/io/background_loading.html
	var scene = load(LEVELS_DIR + level_to_load + ".tscn")
	if scene:
		var si = scene.instance()
		get_parent().get_parent().add_child(si)
#		get_parent().queue_free()
	else:
		print('something went wrong loading scene')

func _on_Dont_pressed():
	$AnimationPlayer.play_backwards("Pop")
#	get_parent().queue_free()
