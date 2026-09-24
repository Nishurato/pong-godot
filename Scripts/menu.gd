extends CanvasLayer

var game_ai_scene = preload("res://game.tscn").instantiate()
var game_two_players_scene = preload("res://game_players.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_quit_button_button_down() -> void:
	get_tree().quit()


func _on_ai_play_button_button_down() -> void:
	get_tree().change_scene_to_file("res://game.tscn")


func _on_player_2_play_button_button_down() -> void:
	get_tree().change_scene_to_file("res://game_players.tscn")
