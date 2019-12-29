extends Node2D
class_name BaseLevel

# base class to be inherited by levels

export(String) var level_name
export(int) var level_index

# preload all subscenes for a level
#export(Array, PackedScene) = [preload('SubScene')]

func set_level_complete():
	SaveSystem.data.levels[level_index] = true
	SaveSystem.data.last_level = level_name

func _exit_tree():
	_on_leave_level()

func _on_leave_level():
	SaveSystem.data.last_level = level_name
	SaveSystem.save()
