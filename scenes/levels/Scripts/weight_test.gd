extends Node2D

func _on_cord_cord_ready():
	var weight_scn = load("res://scenes/weight/weight.tscn")
	var weight = weight_scn.instance()
	$cord.attach_object(weight)
