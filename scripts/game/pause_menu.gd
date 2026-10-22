extends Control

func _ready() -> void:
	visible = false
	EventBus.setting.connect(_pause)
	EventBus.resume.connect(_resume)

func _on_resume_pressed() -> void:
	visible = false
	EventBus.start_resume.emit()

func _resume() -> void:
	get_tree().paused = false


func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/game/main.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/game/main_menu.tscn")

func _pause() -> void:
	visible = true
	get_tree().paused = true
