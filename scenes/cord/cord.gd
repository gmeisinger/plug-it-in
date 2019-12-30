extends Node2D

export var LENGTH : int
export var SOFTNESS = 0.1
export var BIAS = 0.9

var segment = preload("res://scenes/cord/cord_segment.tscn")

func _ready():
	build_cord()

func build_cord():
	var parent = $anchor
	for i in range(LENGTH):
		var child = add_segment(parent)
		add_joint(parent, child)
		parent = child
		# hide the last segment - looks better. Comment out to see difference
		if i == LENGTH-1:
			child.get_node('Sprite').hide()

func add_segment(parent):
	var new_segment = segment.instance()
	new_segment.position = parent.position + parent.get_end()
	add_child(new_segment)
	return new_segment

func add_joint(parent, child):
	var new_joint = PinJoint2D.new()
	new_joint.position = parent.get_end()
	new_joint.node_a = parent.get_path()
	new_joint.node_b = child.get_path()
	new_joint.softness = SOFTNESS
	new_joint.bias = BIAS
	parent.add_child(new_joint)
