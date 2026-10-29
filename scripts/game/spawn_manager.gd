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
	timer.timeout.connect(_spawn_algo2)
	timer.start()

	EventBus.resume.connect(_start_timer)
	EventBus.setting.connect(_pause_timer)


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

#region spawn Algo's

func _spawn() -> void:
	if paused: 
		return
	var random_idx := _pick_random()
	var spawn_point := cookie_spawn_point[random_idx]

	for point in cookie_spawn_point:
		var cookie := cookie_scene.instantiate() as Cookie
		await get_tree().create_timer(0.1).timeout
		spawn_point.add_child(cookie)



func _spawn_algo2 (count : int = 2) -> void:
	if paused: 
		return
	
	var used_spawn_point : Array = []

	for i in count:
		var idx := _pick_random()
		while used_spawn_point.has(idx):
			idx = _pick_random()
		used_spawn_point.append(idx)

		var cookie := cookie_scene.instantiate() as Cookie
		
		await get_tree().create_timer(0.2).timeout

		cookie_spawn_point[idx].add_child(cookie)


#endregion spawn Algo's