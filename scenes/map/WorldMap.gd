extends Node

# Loading game creates world map - you always load into world map
# at last_level, and loading level, reloads to last position (or restart level option)
# Loading game from title, creates this node and sets data_index based on 'save game' selected

# Right now an Area collides with areas defined in scene graph WorldMap::Levels
# Area is in WorldMapPath. The collider for level dialog pop up is in levels.

func _enter_tree():
	set_levels_completed()

func set_levels_completed():
	var level_portals = get_node('LevelPortals').get_children()
	for portal in level_portals:
		for dependency_index in portal.level_dependencies:
			if not SaveSystem.data.levels[dependency_index]:
				portal.locked = true
				break
