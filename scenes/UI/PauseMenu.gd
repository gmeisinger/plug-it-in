extends Control

func _ready():
	pass

func leave_pause_menu():
	$AnimationPlayer.play_backwards("Pop")
	# queue_free() # ?
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
