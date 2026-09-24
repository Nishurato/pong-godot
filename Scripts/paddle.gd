extends Area2D

@export var speed = 350
@export var up_key_string = "player1_up"
@export var down_key_string = "player1_down"
@export var player_or_ai = "Player"
var ball_y_position = 0
var no_direction_movement = [false, false] # You can't move up or down


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_or_ai == "Player":
		_player_control(delta)
	elif player_or_ai == "AI":
		_ai_control(delta)

func _player_control(delta: float):
	if position.y < 89:
		no_direction_movement[0] = true
	elif position.y > 631:
		no_direction_movement[1] = true
		
	if Input.is_action_pressed(up_key_string) and !no_direction_movement[0]:
		position.y -= speed * delta
		no_direction_movement[1] = false
	elif Input.is_action_pressed(down_key_string) and !no_direction_movement[1]:
		position.y += speed * delta
		no_direction_movement[0] = false

func _ai_control(delta: float):
	if position.y < 89:
		ball_y_position = 90
	elif position.y > 631:
		ball_y_position = 630
	
	position = position.lerp(Vector2(position.x, ball_y_position), (speed / 75.0) * delta)
