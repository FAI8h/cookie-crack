extends Node
class_name SpawnManager

@export var cookie_interval : float = .8
@export var cookie_scene : PackedScene
@export var timer : Timer

@export var cookie_spawn_nodes : Node
var cookie_spawn_point : Array[Node]

func _ready() -> void:
	cookie_spawn_point = cookie_spawn_nodes.get_children()
	timer.wait_time = cookie_interval
	timer.timeout.connect(_spawn)
	timer.start()


func _spawn() -> void:
	for point in cookie_spawn_point:
		var cookie := cookie_scene.instantiate() as Cookie
		cookie_spawn_point[_pick_random()].add_child(cookie)
		await get_tree().create_timer(0.3).timeout

func _pick_random() -> int:
	return randi() % 3
