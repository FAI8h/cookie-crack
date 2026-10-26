extends Node

var scene_paths : Dictionary = {
	"main_menu":"res://scenes/game/main_menu.tscn",
	"game_over":"res://scenes/game/game_over.tscn"
}

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	EventBus.main_menu.connect(_on_main_menu_pressed)


func _on_main_menu_pressed() -> void:
	print("main_menu signal recived : ",scene_paths.main_menu)
	SceneLoader.load_scene(scene_paths.main_menu)

func _on_game_over() -> void:
	SceneLoader.load_scene(scene_paths.game_over)
