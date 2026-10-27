extends Node

var scene_paths : Dictionary = {
	"main_tree":"res://scenes/game/main.tscn",
	"main_menu":"res://scenes/game/main_menu.tscn",
	"game_over":"res://scenes/game/game_over.tscn"
}

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	EventBus.main_menu.connect(_on_main_menu_pressed)
	EventBus.restart.connect(_on_restart_pressed)
	EventBus.retry.connect(_on_restart_pressed)


func _on_main_menu_pressed() -> void:
	SceneLoader.load_scene(scene_paths.main_menu)

func _on_game_over() -> void:
	SceneLoader.load_scene(scene_paths.game_over)

func _on_restart_pressed() -> void:
	SceneLoader.load_scene(scene_paths.main_tree)
