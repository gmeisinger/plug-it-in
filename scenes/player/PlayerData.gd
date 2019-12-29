extends Resource
class_name PlayerData

# Acts like Unity's ScriptableObject and/or Unreal's Data/CurveTables
# Just data we can store and use easily in scripts (auto-serialization)
# this data is de/serialized as well as accessed via SaveSystem.gd singleton

# NOTE: Have to use export to serialize variables
export(String) var last_level
export(Vector2) var last_pos
export(Array, bool) var levels = [false, false, false, false, false]
export(Array, bool) var sublevels = [false, false, false]
export(int) var health

## all attr must exist in _init args to save/load resource to/from disk
func _init(i_last_level="",
			i_last_pos=Vector2(),
			i_levels = [false, false, false, false, false],
			i_sublevels = [false, false, false],
			i_health = 100
			):
	last_level = i_last_level
	last_pos = i_last_pos
	levels = i_levels
	sublevels = i_sublevels
	health = i_health