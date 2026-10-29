extends Node
class_name SpawnManager

@export var cookie_interval : float = .6
@export var cookie_scene : PackedScene
@export var timer : Timer
var paused : bool = false

@export var cookie_spawn_nodes : Node
var cookie_spawn_point : Array[Node]

func _ready() -> void:
	cookie_spawn_point = cookie_spawn_nodes.get_children()
	timer.wait_time = cookie_interval
	timer.timeout.connect(_spawn)
	timer.start()

	EventBus.resume.connect(_start_timer)
	EventBus.setting.connect(_pause_timer)


func _spawn() -> void:
	if paused: 
		return
	var random_idx := _pick_random()
	var spawn_point := cookie_spawn_point[random_idx]

	for point in cookie_spawn_point:
		var cookie := cookie_scene.instantiate() as Cookie
		await get_tree().create_timer(0.3).timeout
		spawn_point.add_child(cookie)

func _pick_random() -> int:
	return randi() % 3

func _pause_timer() -> void:
	_toggle_pause()
	timer.stop()

func _start_timer() -> void:
	_toggle_pause()
	timer.start()

func _toggle_pause() -> void:
	paused = !paused

