extends Node

const DATA_FILES = ['user://data1', 'user://data2', 'user://data3']
const FILE_TYPE = '.tres' # change to res for binary serialization (vs text)

# set at runtime at title screen (load game selects index)
var data_index = 0
var data: PlayerData = PlayerData.new()

# PUBLIC METHODS
func load_data():
	data = ResourceLoader.load(DATA_FILES[data_index]+FILE_TYPE)
	if not data:
		data = PlayerData.new()

func save_data():
	ResourceSaver.save(DATA_FILES[data_index]+FILE_TYPE, data)

### TEST METHOD -- uncomment _ready
#func _ready():
#	_create_test_data()
#
#func _create_test_data():
#	data = PlayerData.new()
#	data.last_pos = Vector2(0.5,1)
#	data.levels[0] = true
#	data.last_level = "Level2"
#	save_data()
#	load_data()
#	print(data.levels)
#	print(data.last_level)