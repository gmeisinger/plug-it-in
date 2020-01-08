extends Node2D

func _ready():
	OS.set_window_position(Vector2.ZERO)

func _on_cord_cord_ready():
	var weight_scn = load("res://scenes/weight/weight.tscn")
	var weight = weight_scn.instance()
	#var player = $player
	$cord.attach_object(weight)
