extends Control

func _ready() -> void:
    visible = false
    EventBus.game_over.connect(_show_game_over)

func _show_game_over(_point : int)-> void:
    visible = true

func _on_retry_pressed() -> void:
    get_tree().paused = false
    get_tree().change_scene_to_file("res://scenes/game/main.tscn")


func _on_main_menu_pressed() -> void:
    get_tree().paused = false
    EventBus.main_menu.emit()


func _on_exit_pressed() -> void:
    get_tree().quit()
