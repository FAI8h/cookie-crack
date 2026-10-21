extends Control

func _ready() -> void:
	visible = false
	EventBus.setting.connect(_pause)

func _on_resume_pressed() -> void:
	visible = false
	get_tree().paused = false


func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/game/main.tscn")


func _on_main_menu_pressed() -> void:
	pass # Replace with function body.

func _pause() -> void:
	visible = true
	get_tree().paused = true
