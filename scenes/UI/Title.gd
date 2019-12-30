extends Control

onready var world_map = preload("res://scenes/map/WorldMap.tscn")

func _on_SaveMenu_id_pressed(id):
	SaveSystem.data_index = id
	get_tree().get_root().add_child(world_map.instance())
	self.queue_free()

func _on_Quit_pressed():
	get_tree().quit()