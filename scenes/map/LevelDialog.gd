extends Control

# 2 buttons: go and don't -- But maybe should have continue/restart if you quit mid level

onready var animationPlayer = $AnimationPlayer
var level_to_load # set by MapLevel in _on_entered_level_dialog_collider

# MapLevel calls to pop up this node
func _on_entered_level_dialog_collider(level):
	show()
	animationPlayer.play("Pop")
	level_to_load = level

func _on_Go_pressed():
	animationPlayer.play_backwards("Pop")
	# remove this yield when we get background loading
	yield(animationPlayer, "animation_finished") 
	# TODO: use ResourceInteractiveLoader and use a loading screen
	# https://docs.godotengine.org/en/3.1/tutorials/io/background_loading.html
	var scene = load(level_to_load)
	if scene:
		var si = scene.instance()
		get_parent().get_parent().add_child(si)
		get_parent().queue_free()
	else:
		print('something went wrong loading scene')

func _on_Dont_pressed():
	animationPlayer.play_backwards("Pop")
	yield(animationPlayer, "animation_finished")
	hide()
