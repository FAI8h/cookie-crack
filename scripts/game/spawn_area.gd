extends Area2D
class_name SpawnArea

@export var arena_container : Node
@export var cracker_scene : PackedScene

@onready var timer : Timer = $Timer

var can_spawn : bool = true

func _ready() -> void:
	timer.wait_time = 0.5
	timer.autostart = false
	timer.timeout.connect(_on_timer_timeout)

	EventBus.god_mode.connect(god_mode)
	pass

func spawn(unit) -> void:
	arena_container.add_child(unit)
	timer.start()
	can_spawn = false


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	# print(event)
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if not can_spawn:
				return
			var cracker := cracker_scene.instantiate()
			_set_position(event.position, cracker)
			spawn(cracker)


func _set_position(mouse_pos : Vector2, unit) -> void:
	var rect : ColorRect = $ColorRect

	unit.global_position.x = rect.global_position.x + rect.size.x / 2.0
	unit.global_position.y = mouse_pos.y


func _on_area_entered(area: Area2D) -> void:
	if area is Cookie:
		EventBus.died.emit()

func god_mode() -> void:
	collision_mask = 2

func _on_timer_timeout () -> void:
	can_spawn = true;



func _check_spawn_position() -> void:
	pass
