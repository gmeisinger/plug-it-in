extends "res://scenes/stateMachine/baseState.gd"

func update(delta):
	if not host.get_node("AnimationPlayer").is_playing():
		change_state("moving")