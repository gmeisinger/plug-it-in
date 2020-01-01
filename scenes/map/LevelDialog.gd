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
	yield(animationPlayer, "animation_finished")
	SceneLoader.current_scene = get_parent()
	SceneLoader.load_level(level_to_load)

func _on_Dont_pressed():
	animationPlayer.play_backwards("Pop")
	yield(animationPlayer, "animation_finished")
	hide()
