extends Node2D
class_name BaseLevel

# base class to be inherited by levels

export(String) var level_name
export(int) var level_index

func set_level_complete():
	SaveSystem.data.levels[level_index] = true
	SaveSystem.data.last_level = name

func _exit_tree():
	_on_leave_level()

func _on_leave_level():
	SaveSystem.data.last_level = name
	SaveSystem.save()
