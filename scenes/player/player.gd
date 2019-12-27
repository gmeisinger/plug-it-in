extends KinematicBody2D

var velocity : Vector2
var walk_speed = 50.0
var max_walk_speed = 300.0
var jump_speed = 450
var FRICTION = 700.0
var floor_normal = Vector2.UP
var gravity_vector = Vector2(0, 900)
var slope_slide_stop = 25.0

# Movement
func process_horizontal_movement(delta):
	#check input and set velocity
	var target_velocity = 0.0
	if Input.is_action_pressed("move_left"):
		target_velocity -= walk_speed
		$Sprite.flip_h = true
	if Input.is_action_pressed("move_right"):
		target_velocity += walk_speed
		$Sprite.flip_h = false
	velocity.x += target_velocity
	if abs(velocity.x) > max_walk_speed:
		velocity.x = sign(velocity.x) * max_walk_speed

func process_move_and_slide(delta):
	velocity += delta * gravity_vector
	velocity = move_and_slide(velocity, floor_normal, slope_slide_stop)

func jump():
	velocity.y -= jump_speed

func apply_friction(delta):
	var new_speed = abs(velocity.x) - (FRICTION * delta)
	if new_speed < 0.0:
		new_speed = 0.0
	velocity.x = sign(velocity.x) * new_speed

# Animation
func play_anim(anim_name, speed : float = 1.0):
	if $AnimationPlayer.current_animation != anim_name:
		$AnimationPlayer.play(anim_name, -1, speed)