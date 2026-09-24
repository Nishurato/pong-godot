extends Node

var player1_score = 0
var player2_score = 0
var ball_touches = 0
@export var ball_scene: PackedScene

func _ready() -> void:
	$ApperanceSFX.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		_restart_game()
		
	if Input.is_action_just_pressed("quit_from_game"):
		queue_free()
		get_tree().change_scene_to_file("res://menu.tscn")
	
	_ball_node_check()

func _ball_node_check():
	if has_node("Ball"):
		if $Paddle2.player_or_ai == "AI":
			$Paddle2.ball_y_position = $Ball.position.y
			$Paddle.ball_y_position = $Ball.position.y
			
		if $Ball.position.x < -100:
			player2_score += 1
			$HUD/Player2Score.text = str(player2_score)
			$Ball.destory.emit()
			$ApperanceSFX.play()
		elif $Ball.position.x > 1380:
			player1_score += 1
			$HUD/Player1Score.text = str(player1_score)
			$Ball.destory.emit()
			$ApperanceSFX.play()
	else:
		var ball = ball_scene.instantiate()
		ball.position = Vector2(640, 375)
		add_child(ball)

func _restart_game():
	get_tree().reload_current_scene()

func _direction_y_calculation(ball_pos, paddle_pos):
	var result_pos = ball_pos - paddle_pos
	var max_pos = 75
	var calculation_result = abs(result_pos) / max_pos
	#Thanks Grady!
	if result_pos < 0:
		return calculation_result * -1
	elif result_pos > 0:
		return calculation_result
	else:
		return randf_range(-0.25, 0.25)

func _on_paddle_2_body_entered(body: Node2D) -> void:
	var is_behind = $Ball.position.x > $Paddle2.position.x
	if body.name == "Ball":
		$BounceSFX.play()
		$Ball.direction.y = _direction_y_calculation(
				$Ball.position.y, $Paddle2.position.y)
		$Ball.speed += 50
		if !is_behind:
			$Ball.direction.x = -1


func _on_paddle_body_entered(body: Node2D) -> void:
	var is_behind = $Ball.position.x < $Paddle.position.x
	if body.name == "Ball":
		$Ball.direction.y = _direction_y_calculation(
			$Ball.position.y, $Paddle.position.y)
		$Ball.speed += 50
		$BounceSFX.play()
		if !is_behind:
			$Ball.direction.x = 1


func _on_wall_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		$Ball.direction.y *= -1
		$BounceSFX.play()


func _on_wall_2_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		$Ball.direction.y *= -1
		$BounceSFX.play()
