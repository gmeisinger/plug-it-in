extends Node2D
class_name BaseSubLevel

export(int) var sub_level_index

func set_sublevel_complete():
	SaveSystem.data.sublevels[sub_level_index] = true
	on_sublevel_quit()

func on_sublevel_quit():
	# return to last_level
#	var last_level_still_loaded = get_parent().get_node(SaveSystem.data.last_level)
#	last_level_still_loaded.show()
	self.queue_free()
