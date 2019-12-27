extends Node2D

export var node_a : NodePath
export var node_b : NodePath

var nodeA : Node2D
var nodeB : Node2D

var MAX_DISTANCE = 1.0

func _ready():
	nodeA = get_node(node_a)
	nodeB = get_node(node_b)

func resolve(delta):
	var distance = nodeB.global_position.distance_to(global_position)
	if distance > MAX_DISTANCE:
		var a = global_position
		var b = nodeB.global_position
		nodeA.rotation = nodeA.global_position.angle_to_point(b) + (PI/2)
		nodeB.global_position = global_position