extends Node2D

var SOFTNESS = 0.1
var BIAS = 0.9
export var length : int

#export(String, FILE, "*.tscn") var segment_scene
var segment = preload("res://scenes/cord/cord_segment.tscn")
var joint = preload("res://scenes/cord/cord_joint.tscn")

var joints = []

func _ready():
	#build_cord()
	pass
	
func add_segment(parent):
	var new_segment = segment.instance()
	new_segment.position = parent.get_end()
	add_child(new_segment)
	return new_segment

func add_joint(parent, child):
	var new_joint = joint.instance()
	new_joint.position = parent.get_end()
	new_joint.node_a = parent.get_path()
	new_joint.node_b = child.get_path()
	parent.add_child(new_joint)
	joints.append(new_joint)

func build_cord():
	joints = []
	var parent = $anchor
	for i in range(length):
		var child = add_segment(parent)
		add_joint(parent, child)
		parent = child

func resolve_cord(delta):
	for joint in joints:
#		joint.resolve(delta)
		pass

func _physics_process(delta):
	resolve_cord(delta)


func _on_Timer_timeout():
	build_cord()