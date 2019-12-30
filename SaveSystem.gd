extends Node

# This autoload singleton provides global access to a PlayerData object.

const SAVE_PATH = 'user://save_data'
const FILE_TYPE = '.tres' # change to res for binary serialization (vs text)

# set at runtime from title screen (picking save game sets index)
var data_index = 1
var data: PlayerData = PlayerData.new()

# PUBLIC METHODS
func load_data():
	data = ResourceLoader.load(SAVE_PATH+str(data_index)+FILE_TYPE)
	if not data:
		data = PlayerData.new()
		save_data()

func save_data():
	ResourceSaver.save(SAVE_PATH+str(data_index)+FILE_TYPE, data)
