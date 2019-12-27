extends "res://scenes/stateMachine/baseState.gd"

var fall_start_position
var max_fall_height = 2000

func enter():
	host.play_anim("fall")
	fall_start_position = host.global_position

func update(delta):
	if host.is_on_floor():
		#$landingSound.play()
		change_state("moving")
		return
	var fall_distance = host.global_position.y - fall_start_position.y
	host.process_horizontal_movement(delta)
	host.process_move_and_slide(delta)