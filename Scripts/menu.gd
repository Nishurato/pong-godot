extends CanvasLayer

var game_ai_scene = preload("res://game.tscn").instantiate()
var game_two_players_scene = preload("res://game_players.tscn").instantiate()


func _on_quit_button_button_down() -> void:
	get_tree().quit()


func _on_ai_play_button_button_down() -> void:
	get_tree().change_scene_to_file("res://game.tscn")


func _on_player_2_play_button_button_down() -> void:
	get_tree().change_scene_to_file("res://game_players.tscn")
