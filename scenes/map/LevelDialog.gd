extends Control

# 2 buttons: go and don't -- But maybe should have continue/restart if you quit mid level

onready var animationPlayer = $AnimationPlayer
var level_path # set by LevelPortal in pop_up

# LevelPortal calls to pop up this node
func pop_up(level):
	animationPlayer.play("Pop")
	level_path = level

func _on_Go_pressed():
	animationPlayer.play_backwards("Pop")
	yield(animationPlayer, "animation_finished")
	SceneLoader.load_scene(level_path)

func _on_Dont_pressed():
	animationPlayer.play_backwards("Pop")
