extends Node

# Loading game creates world map - you always load into world map
# at last_level, and loading level, reloads to last position (or restart level option)
# Loading game from title, creates this node and sets data_index based on 'save game' selected

# Right now an Area collides with areas defined in scene graph WorldMap::Levels
# Area is in WorldMapPath. The collider for level dialog pop up is in levels.

func _enter_tree():
	SaveSystem.load_data()
	set_levels_completed()

func set_levels_completed():
	var levels = get_node('Levels').get_children()
	var i: int = 0
	for lvl in levels:
		lvl.complete = SaveSystem.data.levels[i]
		i += 1

func _exit_tree():
	on_quit_save_data()

func on_quit_save_data():
	SaveSystem.save_data()
