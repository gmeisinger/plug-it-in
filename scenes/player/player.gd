extends KinematicBody2D

var velocity : Vector2
var MAX_WALK_SPEED = 5.0
var FRICTION = 15.0

# Movement
func process_movement(delta):
	#check input and set velocity
	var target_velocity = 0.0
	if Input.is_action_pressed("move_left"):
		target_velocity -= MAX_WALK_SPEED
		$Sprite.flip_h = true
	if Input.is_action_pressed("move_right"):
		target_velocity += MAX_WALK_SPEED
		$Sprite.flip_h = false
	velocity.x += target_velocity
	if abs(velocity.x) > MAX_WALK_SPEED:
		velocity.x = sign(velocity.x) * MAX_WALK_SPEED

func process_move_and_collide(delta):
	var collision_data = move_and_collide(velocity)
	return collision_data

func apply_friction(delta):
	var new_speed = abs(velocity.x) - (FRICTION * delta)
	if new_speed < 0.0:
		new_speed = 0.0
	velocity.x = sign(velocity.x) * new_speed

# Animation
func play_anim(anim_name, speed : float = 1.0):
	if $AnimationPlayer.current_animation != anim_name:
		$AnimationPlayer.play(anim_name, -1, speed)