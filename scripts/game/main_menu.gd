extends Control
	

func _on_play_pressed() -> void:
	SceneLoader.load_scene("res://scenes/game/main.tscn")


func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
