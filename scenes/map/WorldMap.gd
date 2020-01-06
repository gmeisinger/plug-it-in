extends Node

# This node sets up the LevelPortals
# Dependent on SaveSystem.data having been loaded

func _enter_tree():
	set_levels_completed()

func set_levels_completed():
	var level_portals = get_node('LevelPortals').get_children()
	for portal in level_portals:
		for dependency_index in portal.level_dependencies:
			if not SaveSystem.data.levels[dependency_index]:
				portal.locked = true
				break
