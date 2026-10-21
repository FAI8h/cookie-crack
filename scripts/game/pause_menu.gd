extends Control

func _ready() -> void:
	visible = false

func _on_resume_pressed() -> void:
	visible = false
	get_tree().paused = false


func _on_restart_pressed() -> void:
	pass # Replace with function body.


func _on_main_menu_pressed() -> void:
	pass # Replace with function body.
