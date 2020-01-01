extends Node

# Autoload singleton manages loading larger game scenes
# (WorldMap, Levels, SubLevels?)
# To test it out put some large images (10MB+) as sprites in a level
# then load it from the world map

onready var ui : Control = $"Control"
onready var progress_bar : ProgressBar = $"Control/ProgressBar"

const TIME_MAX = 100

var loader : ResourceInteractiveLoader
var current_scene : Node
var wait_frames: int

func _ready():
	ui.hide()

func load_level(level_to_load):
	loader = ResourceLoader.load_interactive(level_to_load)
	set_process(true)
	ui.show()
	current_scene.queue_free()
	wait_frames = 1

func _process(delta):
	if loader == null:
		set_process(false)
		return
	if wait_frames > 0: # wait for frames to let the "loading" animation show up (using progress bar for now)
		wait_frames -= 1
		return
	var t = OS.get_ticks_msec()
	while OS.get_ticks_msec() < t + TIME_MAX: # how long we block this thread
		var err = loader.poll()
		if err == ERR_FILE_EOF: # Finished loading.
			var resource = loader.get_resource()
			loader = null
			set_new_scene(resource)
			break
		elif err == OK:
			update_progress()
			break
		else: # error during loading
			show_error()
			loader = null
			break

func update_progress():
	var progress = float(loader.get_stage()) / loader.get_stage_count()
	progress_bar.set_value(progress)

func set_new_scene(scene_resource):
	progress_bar.set_value(0)
	ui.hide()
	current_scene = scene_resource.instance()
	get_node("/root").add_child(current_scene)

func show_error():
	print('Dang... something went wrong!')